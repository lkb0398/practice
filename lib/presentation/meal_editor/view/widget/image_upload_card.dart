import 'dart:io';

import 'package:flutter/material.dart';

class ImageUploadCard extends StatelessWidget {
  /// 이미지 카드
  const ImageUploadCard({
    super.key,
    this.imageFile,
    this.photoUrl,
    this.isUploading = false,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  final File? imageFile;
  final String? photoUrl;
  final bool isUploading;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  bool get hasImage => imageFile != null || photoUrl != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasImage ? null : onPickImage,
      child: Stack(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              color: hasImage ? null : const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(14),
              image: imageFile != null
                  ? DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover,
                    )
                  : photoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(photoUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: !hasImage
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          size: 44,
                          color: Colors.black26,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '이미지 추가',
                          style: TextStyle(color: Colors.black38, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                : null,
          ),

          // 이미지 변경/제거 버튼
          if (hasImage)
            Positioned(
              top: 12,
              right: 12,
              child: Row(
                children: [
                  // 변경 버튼
                  GestureDetector(
                    onTap: onPickImage,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 제거 버튼
                  GestureDetector(
                    onTap: onRemoveImage,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // 업로드 중 표시
          if (isUploading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
