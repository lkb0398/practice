import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/app_theme.dart';

class SelectBox extends StatelessWidget {
  const SelectBox({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.text,
    this.height,
  });

  final void Function() onTap;
  final bool isSelected;
  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1.5,
            color: isSelected ? fxc(context).primary500! : vrc(context).border!,
          ),
          color: isSelected ? fxc(context).primary100 : Colors.transparent,
        ),
        height: height,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isSelected ? fxc(context).primary500 : vrc(context).text,
          ),
        ),
      ),
    );
  }
}
