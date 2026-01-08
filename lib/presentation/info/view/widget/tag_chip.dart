import 'package:flutter/material.dart';
import 'package:vitameal/core/theme/app_theme.dart';

enum TagType { disease, allergy }

class UserTag {
  UserTag({required this.label, required this.type});

  final String label;
  final TagType type;
}

class TagChip extends StatelessWidget {
  const TagChip(this.tag, {super.key});

  final UserTag tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _backgroundColor(context, tag.type),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag.label,
        style: TextStyle(color: _textColor(context, tag.type), fontSize: 12),
      ),
    );
  }

  Color _backgroundColor(BuildContext context, TagType type) {
    switch (type) {
      case TagType.disease:
        return fxc(context).secondary100!;
      case TagType.allergy:
        return fxc(context).primary100!;
    }
  }

  Color _textColor(BuildContext context, TagType type) {
    switch (type) {
      case TagType.disease:
        return fxc(context).secondary400!;
      case TagType.allergy:
        return fxc(context).primary400!;
    }
  }
}
