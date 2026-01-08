import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/app_theme.dart';

class IntroControls extends StatelessWidget {
  final int itemsCount;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const IntroControls({
    super.key,
    required this.itemsCount,
    required this.currentIndex,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentIndex == itemsCount - 1;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
        vertical: 32.0,
      ),
      child: Column(
        children: [
          // 페이지 인디케이터
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              itemsCount,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 10),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? fxc(context).primary400
                      : Color(0xffd9d9d9),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // 다음 버튼
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: fxc(context).primary400,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                "다음",
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),

          // 건너뛰기 버튼
          Opacity(
            opacity: isLastPage ? 0.0 : 1.0,
            child: TextButton(
              onPressed: isLastPage ? null : onSkip,
              child: Text(
                "건너뛰기",
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Color(0xffbcbcbc),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
