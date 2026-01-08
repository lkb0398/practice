/// Enhanced enum
/// 도메인 enum - db 값 매핑
enum MealCategory {
  breakfast('breakfast'),
  lunch('lunch'),
  dinner('dinner'),
  snack('snack');

  const MealCategory(this.value);

  final String value;

  static MealCategory fromString(String value) {
    return MealCategory.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MealCategory.breakfast,
    );
  }
}
