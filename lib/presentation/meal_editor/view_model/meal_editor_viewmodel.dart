import 'dart:io';

import 'package:collection/collection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/domain/entity/meal_entry_entity.dart';
import 'package:vitameal/domain/enum/meal_category_enum.dart';
import 'package:vitameal/domain/repository/meal_repository.dart';
import 'package:vitameal/domain/repository/storage_repository.dart';

part 'meal_editor_viewmodel.g.dart';

/// 식단 에디터 폼의 생성/수정을 다룸, 상태-hook
@riverpod
class MealEditorViewModel extends _$MealEditorViewModel {
  MealRepository get _mealRepository => ref.read(mealRepositoryProvider);
  StorageRepository get _storageRepository => ref.read(storageRepositoryProvider);

  /// hook 사용해서 vm에서 상태 안다룸, 예외처리도 hookwidget에서
  @override
  void build() {}

  /// 기존 MealEntry 로드
  Future<MealEntryEntity?> loadEntry({
    required String mealDayId,
    required String entryId,
  }) async {
    final entries = await _mealRepository.getMealEntriesByMealDayId(mealDayId: mealDayId);
    return entries.firstWhereOrNull((e) => e.id == entryId);
  }

  /// 이미지 선택
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1920,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// 이미지 업로드
  Future<String?> uploadImage({
    required File imageFile,
    required String userId,
  }) async {
    return await _storageRepository.uploadMealImage(
      file: imageFile,
      userId: userId,
    );
  }

  /// 저장 (생성/수정)
  Future<void> save({
    required String userId,
    required DateTime date,
    required MealCategory category,
    required String content,
    DateTime? selectedTime,
    File? imageFile,
    String? existingPhotoUrl,
    String? mealDayId,
    String? entryId,
  }) async {
    // 데이터 검증
    final hasContent = content.trim().isNotEmpty;
    final hasImage = imageFile != null || existingPhotoUrl != null;

    if (!hasContent && !hasImage) {
      throw Exception('식단 내용이나 이미지를 입력해주세요');
    }

    // MealDay 생성
    String activeMealDayId = mealDayId ?? '';
    if (activeMealDayId.isEmpty) {
      final newMealDay = await _mealRepository.getOrCreateMealDay(
        userId: userId,
        date: date,
      );
      activeMealDayId = newMealDay.id;
    }

    // 새로 업로드한 이미지가 있으면 이미지 업로드
    String? finalPhotoUrl = existingPhotoUrl;
    if (imageFile != null) {
      finalPhotoUrl = await uploadImage(
        imageFile: imageFile,
        userId: userId,
      );
    }
    
    final contentToSave = content.trim().isEmpty ? null : content.trim();

    if (entryId != null) {
      // 저장 (수정 모드)
      await _mealRepository.updateMealEntry(
        entryId: entryId,
        category: category,
        content: contentToSave,
        photoUrl: finalPhotoUrl,
        eatenAt: selectedTime,
      );
    } else {
      // 저장 (생성 모드)
      await _mealRepository.createMealEntry(
        mealDayId: activeMealDayId,
        category: category,
        content: contentToSave,
        photoUrl: finalPhotoUrl,
        eatenAt: selectedTime,
      );
    }
  }

  /// 삭제
  Future<void> delete({
    required String entryId,
  }) async {
    await _mealRepository.deleteMealEntry(entryId: entryId);
  }
}
