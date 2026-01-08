import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  final void Function()? onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        height: 56,
        width: double.infinity,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
