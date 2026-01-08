import 'dart:io';
import 'package:flutter/material.dart';

class RecipeStepUIModel {
  File? image;
  final TextEditingController controller;

  RecipeStepUIModel({this.image, required this.controller});

  // 데이터 레이어로 넘기기 위해 Map으로 변환하는 헬퍼 메서드
  Map<String, dynamic> toDataMap(int order, String? uploadedImageUrl) {
    return {
      'step_order': order,
      'description': controller.text,
      'image_url': uploadedImageUrl,
    };
  }
}
