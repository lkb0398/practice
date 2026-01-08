import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? actions;

  const CustomAppBar({super.key, this.leading, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            leading ?? const SizedBox(width: 40),
            Expanded(child: Center(child: title)),
            actions ?? const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
