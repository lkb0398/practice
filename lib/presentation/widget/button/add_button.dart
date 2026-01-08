import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onTap,
    required this.borderColor,
    required this.text,
    required this.textColor,
  });

  final void Function() onTap;
  final Color borderColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        alignment: Alignment.center,
        height: 56,
        width: double.infinity,
        child: Text(text, style: TextStyle(fontSize: 16, color: textColor)),
      ),
    );
  }
}
