import 'package:flutter/material.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';

class MealCard extends StatelessWidget {
  /// 식단 기록 카드
  const MealCard({
    super.key,
    required this.entryId,
    required this.category,
    this.content,
    this.photoUrl,
    this.eatenAt,
    this.onTap,
  });

  final String entryId;
  final MealCategory category;
  final String? content;
  final String? photoUrl;
  final DateTime? eatenAt;
  final VoidCallback? onTap;

  String get _categoryLabel {
    switch (category) {
      case MealCategory.breakfast:
        return '아침';
      case MealCategory.lunch:
        return '점심';
      case MealCategory.dinner:
        return '저녁';
      case MealCategory.snack:
        return '간식';
    }
  }

  String get _timeLabel {
    if (eatenAt == null) return '';
    final hour = eatenAt!.hour;
    final minute = eatenAt!.minute;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // 이미지 없으면 이미지 홀더
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: photoUrl != null ? null : Colors.black12,
                borderRadius: BorderRadius.circular(12),
                image: photoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(photoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: photoUrl == null
                  ? const Icon(Icons.restaurant, size: 20, color: Colors.black26)
                  : null,
            ),
            const SizedBox(width: 12),
            // 식단 카테고리, 먹은 시간 라벨
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _categoryLabel,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      if (_timeLabel.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Text(
                          '| $_timeLabel',
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                  // 기록한 내용
                  if (content != null && content!.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      content!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
