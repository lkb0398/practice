import 'package:flutter/material.dart';

class AdherencePicker extends StatelessWidget {
  /// 성취도 자가평가 선택
  const AdherencePicker({
    super.key,
    required this.selectedDay,
    required this.adherence,
    required this.onPick,
  });

  final DateTime selectedDay;
  final Color? adherence;
  final void Function(Color c) onPick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("오늘 식단 자가평가", style: TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 10),
          Row(
            children: [
              _DotPickerItem(
                color: Colors.redAccent,
                selected: adherence == Colors.redAccent,
                onTap: () => onPick(Colors.redAccent),
              ),
              _DotPickerItem(
                color: Colors.orangeAccent,
                selected: adherence == Colors.orangeAccent,
                onTap: () => onPick(Colors.orangeAccent),
              ),
              _DotPickerItem(
                color: Colors.green,
                selected: adherence == Colors.green,
                onTap: () => onPick(Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 24),
        ],
      ),
    );
  }
}

class _DotPickerItem extends StatelessWidget {
  const _DotPickerItem({required this.color, required this.selected, required this.onTap});

  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: selected ? Border.all(color: Colors.black87, width: 2) : null,
          ),
        ),
      ),
    );
  }
}
