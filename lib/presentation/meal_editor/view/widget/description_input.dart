import 'package:flutter/material.dart';

class DescriptionInput extends StatelessWidget {
  /// 식단 내용 입력 칸
  const DescriptionInput({super.key, required this.controller, this.maxLength = 100});

  final TextEditingController controller;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "설명",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            TextField(
              controller: controller,
              maxLines: 6,
              maxLength: maxLength,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(14, 14, 14, 26),
                hintText: "",
                counterText: "", // 스택으로 위에 표시할거임
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFBBBBBB)),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 8,
              // 글자 수 카운터
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, _) {
                  return Text(
                    "${value.text.length}/$maxLength자",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
