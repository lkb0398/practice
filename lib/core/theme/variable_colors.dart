import 'package:flutter/material.dart';

/// < 테마 변경시 바뀌는 색들 : vrc(context).text 로 사용 >
@immutable
class VariableColors extends ThemeExtension<VariableColors> {
  const VariableColors({
    required this.background,
    required this.text,
    required this.border,
    required this.selectedItem,
    required this.emptyText,
    required this.greyBackground,
    required this.imagePlusIcon,
    required this.infoContainer,
  });
  final Color? background; // 배경색 (white > textcolor 700)
  final Color? text; // 검정 텍스트 (textcolor 700 > 0,50,100)
  final Color? border; // 테두리 (textcolor 200,300 > 500)
  final Color? selectedItem; // 바텀 네비게이션 활성화 색상 (textcolor 700 >  primary 400)
  final Color? emptyText; // 리스트 비어있을 때 아이콘,텍스트, (textcolor 100 > 600)
  final Color? greyBackground; // 이미지 추가 영역 배경, 드롭다운 배경 (textcolor 50 > 600)
  final Color? imagePlusIcon; // 이미지 추가 영역 아이콘 (textcolor 300 > 700)
  final Color? infoContainer; // 내정보 페이지 컨테이너 (textcolor 0 > 800)

  /// 라이트 모드
  static const VariableColors light = VariableColors(
    background: Color(0xFFFFFFFF),
    text: Color(0xFF333333),
    border: Color(0xFFD9D9D9),
    selectedItem: Color(0xFF333333),
    emptyText: Color(0xFFE6E6E6),
    greyBackground: Color(0xFFF2F2F2),
    imagePlusIcon: Color(0xFFBDBDBD),
    infoContainer: Color(0xFFFFFFFF),
  );

  /// 다크모드
  static const VariableColors dark = VariableColors(
    background: Color(0xFF333333),
    text: Color(0xFFFFFFFF),
    border: Color(0xFF737373),
    selectedItem: Color(0xFF89CC00),
    emptyText: Color(0xFF595959),
    greyBackground: Color(0xFF595959),
    imagePlusIcon: Color(0xFF333333),
    infoContainer: Color(0xFF262626),
  );

  @override
  VariableColors copyWith({
    Color? background,
    Color? text,
    Color? border,
    Color? hintText,
    Color? selectedItem,
    Color? emptyText,
    Color? greyBackground,
    Color? imagePlusIcon,
    Color? infoContainer,
  }) => VariableColors(
    background: background ?? this.background,
    text: text ?? this.text,
    border: border ?? this.border,
    selectedItem: selectedItem ?? this.selectedItem,
    emptyText: emptyText ?? this.emptyText,
    greyBackground: greyBackground ?? this.greyBackground,
    imagePlusIcon: imagePlusIcon ?? this.imagePlusIcon,
    infoContainer: infoContainer ?? this.infoContainer,
  );

  @override
  VariableColors lerp(ThemeExtension<VariableColors>? other, double t) {
    if (other is! VariableColors) return this;
    return VariableColors(
      background: Color.lerp(background, other.background, t),
      text: Color.lerp(text, other.text, t),
      border: Color.lerp(border, other.border, t),
      selectedItem: Color.lerp(selectedItem, other.selectedItem, t),
      emptyText: Color.lerp(emptyText, other.emptyText, t),
      greyBackground: Color.lerp(greyBackground, other.greyBackground, t),
      imagePlusIcon: Color.lerp(imagePlusIcon, other.imagePlusIcon, t),
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t),
    );
  }
}
