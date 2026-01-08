import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_tab_provider.g.dart';

/// HomePage 바텀네비게이션 인덱스 상태 Provider
@riverpod
class HomeTab extends _$HomeTab {
  @override
  int build() => 0;
  void change(int index) => state = index;
}
