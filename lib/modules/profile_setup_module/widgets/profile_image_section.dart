// profile_image_section.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class ProfileImageSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final String? profileImagePath;
  final VoidCallback onUploadPressed;

  const ProfileImageSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.profileImagePath,
    required this.onUploadPressed,
  });

  @override
  Widget build(BuildContext context) {
    final containerPadding = _getContainerPadding(screenWidth);
    final imageSize = _getImageSize(screenWidth);
    final uploadButtonSize = _getUploadButtonSize(screenWidth);
    final titleFontSize = _getTitleFontSize(screenWidth);
    final descriptionFontSize = _getDescriptionFontSize(screenWidth);

    return Container(
      padding: EdgeInsets.all(containerPadding),
      child: Column(
        children: [
          // Profile Image with Upload Button
          Stack(
            children: [
              Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: profileImagePath != null
                      ? DecorationImage(
                          image: FileImage(File(profileImagePath!)),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuAlVKGOnTb_w9rkCjJRtDv7ik3TFI-Gmjl7AD6ZtTMQplDZZGpru4mfv2fYNF6eWeqvCS4CoERmpgI0sa_cqs1qwIs8wpfdRRLvK0Yvc4k6y_poGb5HEmDHdL-KD6z6Oq2F0kbt7KuJnBuxKBTRMpxqf0EpJdw7o7RLVJ99x-IYmwJh3RL__c3VZIHXG12J-31Zp9j4xmQiq5xRqARIPa2qdnbXw58bfHvdCGUcaRvENKvYBDur43QwNIcY8EHyJeMje-V5d6LaBc-B',
                          ),
                          fit: BoxFit.cover,
                        ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              // Upload Button
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onUploadPressed,
                  child: Container(
                    width: uploadButtonSize,
                    height: uploadButtonSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.file_upload,
                      color: Colors.white,
                      size: uploadButtonSize * 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: _getSpacing(screenWidth)),
          // Title
          Text(
            'Upload Profile Photo',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          SizedBox(height: _getSpacing(screenWidth) * 0.5),
          // Description
          Text(
            'Add a photo so other users can recognize you',
            style: TextStyle(
              fontSize: descriptionFontSize,
              color: isDark
                  ? AppColors.inputHintDarkProfile
                  : AppColors.inputHintLightProfile,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  double _getContainerPadding(double screenWidth) {
    if (screenWidth < 375) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 24;
    return 28;
  }

  double _getImageSize(double screenWidth) {
    if (screenWidth < 375) return 100;
    if (screenWidth < 600) return 120;
    if (screenWidth < 900) return 140;
    return 160;
  }

  double _getUploadButtonSize(double screenWidth) {
    if (screenWidth < 375) return 32;
    if (screenWidth < 600) return 36;
    if (screenWidth < 900) return 40;
    return 44;
  }

  double _getTitleFontSize(double screenWidth) {
    if (screenWidth < 375) return 18;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 22;
    return 24;
  }

  double _getDescriptionFontSize(double screenWidth) {
    if (screenWidth < 375) return 14;
    if (screenWidth < 600) return 15;
    if (screenWidth < 900) return 16;
    return 17;
  }

  double _getSpacing(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }
}
