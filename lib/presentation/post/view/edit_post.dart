import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../view_model/post_view_model.dart';
import '../view_model/recipe_step_ui_model.dart';
import '../view_model/tag_view_model.dart'; // 태그 불러오기용

class EditPost extends HookConsumerWidget {
  const EditPost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final ingredientController = useTextEditingController();

    final selectedImage = useState<File?>(null);
    // [중요] RecipeStepUIModel을 사용하여 상태 관리
    final recipeSteps = useState<List<RecipeStepUIModel>>([]);
    final titleTextLength = useState<int>(0);
    final ingredientTextLength = useState<int>(0);
    final picker = ImagePicker();

    // [중요] DB에서 태그 리스트 가져오기
    final allTagsAsync = ref.watch(allTagsProvider);
    final selectedTagIds = useState<List<int>>([]);

    final isSubmitting = useState(false);

    Future<File?> pickImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      return pickedFile != null ? File(pickedFile.path) : null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("레시피 작성"),
        actions: [
          TextButton(
            onPressed: isSubmitting.value
                ? null
                : () async {
                    isSubmitting.value = true;
                    try {
                      // ViewModel에 전달할 단계 데이터 가공
                      final stepsData = <Map<String, dynamic>>[];
                      for (int i = 0; i < recipeSteps.value.length; i++) {
                        stepsData.add(
                          recipeSteps.value[i].toDataMap(i + 1, null),
                        );
                      }

                      await ref
                          .read(postViewModelProvider.notifier)
                          .addPost(
                            title: titleController.text,
                            ingredient: ingredientController.text,
                            imageFile: selectedImage.value,
                            selectedTagIds: selectedTagIds.value,
                            steps: stepsData,
                          );

                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      isSubmitting.value = false;
                    }
                  },
            child: isSubmitting.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text("완료"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- 이미지 추가 섹션 (코드 2 디자인) ---
            GestureDetector(
              onTap: () async => selectedImage.value = await pickImage(),
              child: Container(
                width: double.infinity,
                height: 248,
                decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
                child: selectedImage.value != null
                    ? ClipRRect(
                        child: Image.file(
                          selectedImage.value!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add, size: 50),
                          Text("이미지 추가"),
                        ],
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- 제목 섹션 (코드 2 디자인) ---
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "제목",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.error_outline,
                          color: Color(0xFFBCBCBC),
                          size: 11,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "다른 유저들이 쉽게 검색할 수 있도록 작성해주세요 :)",
                          style: TextStyle(
                            color: Color(0xFFBCBCBC),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    onChanged: (value) => titleTextLength.value = value.length,
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${titleTextLength.value}/20자",
                      style: const TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 11,
                      ),
                    ),
                  ),

                  // --- 재료 섹션 (코드 2 디자인) ---
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 12,
                      top: 33,
                    ),
                    child: Text(
                      "재료",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) =>
                        ingredientTextLength.value = value.length,
                    maxLines: 5,
                    controller: ingredientController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${ingredientTextLength.value}/300자",
                      style: const TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 11,
                      ),
                    ),
                  ),

                  // --- 태그 섹션 (DB 연동 + 코드 2 디자인) ---
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 12,
                      top: 33,
                    ),
                    child: Text(
                      "태그",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  allTagsAsync.when(
                    data: (tags) => Wrap(
                      spacing: 8.0,
                      children: tags.map((tag) {
                        final isSelected = selectedTagIds.value.contains(
                          tag.id,
                        );
                        return ChoiceChip(
                          showCheckmark: false,
                          label: Text(
                            tag.name,
                            style: const TextStyle(color: Color(0xFF89CC00)),
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              selectedTagIds.value = [
                                ...selectedTagIds.value,
                                tag.id,
                              ];
                            } else {
                              selectedTagIds.value = selectedTagIds.value
                                  .where((id) => id != tag.id)
                                  .toList();
                            }
                          },
                          selectedColor: const Color(0xFFD2F291),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xFF89CC00)),
                          ),
                        );
                      }).toList(),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, _) => const Text("태그 로드 실패"),
                  ),

                  // --- 레시피 순서 섹션 (코드 2 디자인) ---
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      bottom: 12,
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "레시피 순서",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.error_outline,
                          color: Color(0xFFBCBCBC),
                          size: 11,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "조리 순서대로 작성해주세요 :)",
                          style: TextStyle(
                            color: Color(0xFFBCBCBC),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 단계별 리스트 (코드 2 디자인 + RecipeStepUIModel 로직)
                  ...recipeSteps.value.asMap().entries.map((entry) {
                    int index = entry.key;
                    RecipeStepUIModel step = entry.value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final img = await pickImage();
                              if (img != null) {
                                final newList = [...recipeSteps.value];
                                newList[index].image = img;
                                recipeSteps.value = newList;
                              }
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: step.image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        step.image!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: step.controller,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "${index + 1}번 순서 설명을 입력하세요",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.all(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  // --- 순서 추가 버튼 (코드 2 디자인) ---
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF89CC00)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        recipeSteps.value = [
                          ...recipeSteps.value,
                          RecipeStepUIModel(
                            controller: TextEditingController(),
                          ),
                        ];
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add, color: Color(0xFF89CC00), size: 16),
                          SizedBox(width: 8),
                          Text(
                            "레시피 순서 추가",
                            style: TextStyle(
                              color: Color(0xFF89CC00),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
