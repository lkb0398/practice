import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/app_theme.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final String cancelText;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final Color? confirmColor;
  final bool reverseButtons;
  final String? titleFontFamily;

  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    required this.cancelText,
    required this.confirmText,
    required this.onCancel,
    required this.onConfirm,
    this.confirmColor,
    this.reverseButtons = false,
    this.titleFontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final themeVrc = vrc(context);
    final themeFxc = fxc(context);

    final buttons = [
      Expanded(
        child: SizedBox(
          height: 60,
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: themeVrc.border!, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              cancelText,
              style: TextStyle(
                color: themeVrc.text,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 12),

      Expanded(
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: confirmColor ?? themeFxc.primary400,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              confirmText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
              ),
            ),
          ),
        ),
      ),
    ];

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: themeVrc.border!, width: 1.5),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        constraints: const BoxConstraints(minHeight: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 내용만큼만 높이 차지
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: titleFontFamily ?? 'Pretendard',
                    color: themeVrc.text,
                  ),
                  textAlign: TextAlign.center,
                ),

                if (content != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    content!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      height: 1.5,
                      color: themeVrc.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),

            const SizedBox(height: 25),
            Row(children: reverseButtons ? buttons.reversed.toList() : buttons),
          ],
        ),
      ),
    );
  }
}
