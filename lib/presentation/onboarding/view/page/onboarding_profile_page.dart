import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/data/data_source/profiles_data_source.dart';
import 'package:vitameal/presentation/widget/button/done_button.dart';
import 'package:vitameal/presentation/widget/validate_textformfield.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
import 'package:vitameal/presentation/onboarding/viewmodel/onboarding_view_model.dart';

class OnboardingProfilePage extends HookConsumerWidget {
  const OnboardingProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('my userId : 🩷 ${Supabase.instance.client.auth.currentUser!.id}');

    // 프로필 사진 : 사용자 갤러리에서 사진 가져오기
    final selectedImage = useState<File?>(null);
    final imageUrl = useState<String?>(null);
    Future<void> pickFromGallery() async {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image == null) return;
      final file = File(image.path);
      selectedImage.value = file;
      final url = await ref
          .read(onboardingViewModelProvider.notifier)
          .uploadProfileImage(file);
      imageUrl.value = url;
    }

    // 버튼 활성화 여부
    final isButtonEnabled = useState(false);

    // 닉네임 : 사용자 입력값 받기 + 검증 메시지
    final nicknameController = useTextEditingController();
    String? validateNickname(String? value) {
      if (value == null || value.trim().isEmpty) {
        return '닉네임을 입력해주세요.'; // 입력값 없을 때
      }
      final nickname = value.trim();
      if (nickname.length > 10) {
        return '닉네임은 10글자 이하로 입력해주세요.'; // 길이 제한 (1~10)
      }
      return null; // 통과
    }

    final nicknameError = useState<String?>(null); // 서버 중복 체크 용
    useEffect(() {
      void listener() {
        final nickname = nicknameController.text.trim();
        final isValid = validateNickname(nickname) == null;
        isButtonEnabled.value = isValid;
      }

      nicknameController.addListener(listener);

      return () => nicknameController.removeListener(listener);
    }, []);

    // 수정모드 여부
    final isEditing = ref.watch(isEditFlowProvider);

    // 수정모드 시 기존값 불러오기
    final profileAsync = ref.watch(myProfileProvider);
    final didInit = useRef(false);
    useEffect(() {
      if (!isEditing) return null;
      profileAsync.whenData((profile) {
        if (profile == null) return;
        if (didInit.value) return;
        didInit.value = true;
        if (profile.photoUrl != null && profile.photoUrl!.isNotEmpty) {
          imageUrl.value = profile.photoUrl;
        }
        if (profile.nickname != null) {
          nicknameController.text = profile.nickname!;
          isButtonEnabled.value = true;
        }
      });
      return null;
    }, [isEditing, profileAsync]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                /// 단계 표시
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 16, color: vrc(context).text),
                      children: [
                        TextSpan(
                          text: '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: fxc(context).primary400,
                          ),
                        ),
                        TextSpan(text: ' / 4'),
                      ],
                    ),
                  ),
                ),

                /// 설명
                isEditing
                    ? Text(
                        "프로필 수정",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: vrc(context).text,
                        ),
                      )
                    : Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 22,
                            color: vrc(context).text,
                          ),
                          children: [
                            TextSpan(
                              text: 'VitaMeal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: fxc(context).primary400,
                              ),
                            ),
                            TextSpan(text: '에서 사용할\n'),
                            TextSpan(
                              text: '프로필',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '을 설정해주세요.'),
                          ],
                        ),
                      ),
                SizedBox(height: 40),

                /// 프로필 이미지
                Center(
                  child: InkWell(
                    onTap: () => pickFromGallery(),
                    child: imageUrl.value == null
                        ? Image.asset(
                            'assets/images/profile_image.webp',
                            height: 148,
                            width: 148,
                            fit: BoxFit.cover,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: Image.network(
                              imageUrl.value!,
                              height: 148,
                              width: 148,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                /// 닉네임 입력창
                Text("닉네임"),
                ValidateTextformfield(
                  readOnly: false,
                  hintText: "김비타밀",
                  validator: validateNickname,
                  controller: nicknameController,
                  errorText: nicknameError.value,
                  helperText: '닉네임은 10글자 이하로 입력해주세요.',
                ),
              ],
            ),
          ),
        ),
      ),

      /// 하단 버튼
      bottomNavigationBar: TapDebouncer(
        onTap: isButtonEnabled.value
            ? () async {
                final nickname = nicknameController.text.trim();
                nicknameError.value = null;
                try {
                  // 프로필 업데이트
                  await ref
                      .read(onboardingViewModelProvider.notifier)
                      .updateProfile(
                        nickname: nickname,
                        photoUrl: imageUrl.value,
                      );
                  // mounted 체크
                  if (!context.mounted) return;
                  // 페이지 이동
                  isEditing
                      ? context.go('/')
                      : context.push('/onboarding/physical');
                  // 닉네임 중복 시
                } on DuplicateNicknameException {
                  nicknameError.value = '이미 사용 중인 닉네임입니다.';
                }
              }
            : null,
        builder: (BuildContext context, TapDebouncerFunc? onTap) {
          return DoneButton(
            onTap: onTap,
            backgroundColor: isButtonEnabled.value
                ? fxc(context).primary400!
                : fxc(context).textcolor300!,
            text: isEditing ? "완료" : "다음",
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}
