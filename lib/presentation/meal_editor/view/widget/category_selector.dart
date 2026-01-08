import 'package:flutter/material.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';

class CategorySelector extends StatelessWidget {
  /// 카테고리 선택
  const CategorySelector({super.key, required this.selectedCategory, required this.onCategoryChanged});

  final MealCategory selectedCategory;
  final ValueChanged<MealCategory> onCategoryChanged;

  static const categoryMap = {
    '아침': MealCategory.breakfast,
    '점심': MealCategory.lunch,
    '저녁': MealCategory.dinner,
    '간식': MealCategory.snack,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "분류",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categoryMap.entries
              .map(
                (entry) => _CategoryChip(
                  label: entry.key,
                  selected: selectedCategory == entry.value,
                  onTap: () => onCategoryChanged(entry.value),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF3F3F3) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFFBEBEBE) : const Color(0xFFDDDDDD),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
