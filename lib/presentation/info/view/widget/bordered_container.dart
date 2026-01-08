import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/app_theme.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    required this.child,
  });

  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: vrc(context).infoContainer,
          boxShadow: [
            BoxShadow(
              color: fxc(context).textcolor200!,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16)),
                    subtitle == null
                        ? SizedBox.shrink()
                        : Text(
                            subtitle!,
                            style: TextStyle(
                              fontSize: 12,
                              color: fxc(context).textcolor300,
                            ),
                          ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 12),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
