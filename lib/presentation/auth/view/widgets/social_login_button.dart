import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitameal/core/theme/app_theme.dart';

class SocialLoginButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String? iconPath;
  final double? iconWidth;
  final double? iconHeight;
  final double? height;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const SocialLoginButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.iconPath,
    this.iconWidth,
    this.iconHeight,
    this.height,
    this.fontFamily,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: backgroundColor == Colors.white
              ? BorderSide(color: vrc(context).border ?? Colors.grey)
              : BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              SvgPicture.asset(iconPath!, width: iconWidth, height: iconHeight),
              const SizedBox(width: 10),
            ],
            Text(
              label,
              style: TextStyle(
                fontFamily: fontFamily ?? 'pretendard',
                fontSize: 15,
                fontWeight: fontWeight ?? FontWeight.w600,
                height: height ?? 1.60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
