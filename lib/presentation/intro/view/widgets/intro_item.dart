import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/intro/model/intro_content.dart';

class IntroItem extends StatelessWidget {
  final IntroContent item;

  const IntroItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.of(context).size.width * 0.10;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 56),
        _buildRichTitle(context),
        const SizedBox(height: 20),

        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Image.asset(
              item.image,
              fit: BoxFit.contain,
              width: double.infinity,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRichTitle(BuildContext context) {
    final baseStyle = TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 1.45,
      letterSpacing: -0.44,
      color: vrc(context).text,
    );

    final parts = item.title.split(item.highlight);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: baseStyle,
        children: [
          if (parts.isNotEmpty) TextSpan(text: parts[0]),
          TextSpan(
            text: item.highlight,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              color: fxc(context).secondary400,
            ),
          ),
          if (parts.length > 1) TextSpan(text: parts[1]),
        ],
      ),
    );
  }
}
