/// Enhanced enum
/// 도메인 enum - db 값 매핑
enum AdherenceLevel {
  notFollowed('not_followed'),
  partial('partial'),
  followed('followed');

  const AdherenceLevel(this.value);

  final String value;

  static AdherenceLevel fromString(String value) {
    return AdherenceLevel.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AdherenceLevel.notFollowed,
    );
  }
}
