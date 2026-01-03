import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/core/exports/bloc_exports.dart';
import 'package:throw_app/core/widgets/custom_error_widget.dart';
import 'package:throw_app/modules/home_module/utils/profile_widget_helper.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late final ProfileWidgetHelper _profileWidgetHelper;
  @override
  void initState() {
    super.initState();
    _profileWidgetHelper = ProfileWidgetHelper(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileWidgetHelper.userProfileInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 600;
    final isVerySmallScreen = screenWidth < 400;

    // Color definitions
    const primaryColor = AppColors.primary;
    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final cardColor = AppColors.getCardColor(isDark);
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);
    final textSecondaryColor = AppColors.getTextSecondaryColor(isDark);

    // Responsive dimensions
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final verticalPadding = isSmallScreen ? 16.0 : 24.0;
    final avatarSize = isVerySmallScreen ? 80.0 : 96.0;
    final titleFontSize = isVerySmallScreen ? 20.0 : 24.0;
    final subtitleFontSize = isVerySmallScreen ? 14.0 : 16.0;
    // final sectionFontSize = isSmallScreen ? 18.0 : 20.0;
    final sectionSpacing = isSmallScreen ? 20.0 : 28.0;

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return switch (state) {
          UserProfileInitial() => const SizedBox.shrink(),
          UserProfileLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          UserProfileSuccess(:final userProfile) => Container(
            color: backgroundColor,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  children: [
                    // User Profile Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isSmallScreen ? 20 : 28),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Avatar
                          Container(
                            width: avatarSize,
                            height: avatarSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withValues(alpha: 0.1),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  userProfile.photoUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 16 : 20),
                          Text(
                            userProfile.displayName,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: textPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '@${userProfile.displayName}',
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              color: textSecondaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),

                    SizedBox(height: sectionSpacing),

                    // Account Section
                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: cardColor,
                    //     borderRadius: BorderRadius.circular(16),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withValues(alpha: 0.05),
                    //         blurRadius: 8,
                    //         offset: const Offset(0, 2),
                    //       ),
                    //     ],
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Account',
                    //           style: TextStyle(
                    //             fontSize: sectionFontSize,
                    //             fontWeight: FontWeight.bold,
                    //             color: textPrimaryColor,
                    //           ),
                    //         ),
                    //         SizedBox(height: isSmallScreen ? 16 : 20),
                    //         AccountItem(
                    //           icon: Icons.verified_user_outlined,
                    //           title: 'ID Verification',
                    //           subtitle: 'Verified',
                    //           primaryColor: primaryColor,
                    //           textSecondaryColor: textSecondaryColor,
                    //           isSmallScreen: isSmallScreen,
                    //         ),
                    //         AccountItem(
                    //           icon: Icons.credit_card_outlined,
                    //           title: 'Payment Methods',
                    //           primaryColor: primaryColor,
                    //           textSecondaryColor: textSecondaryColor,
                    //           hasArrow: true,
                    //           isSmallScreen: isSmallScreen,
                    //         ),
                    //         AccountItem(
                    //           icon: Icons.notifications_outlined,
                    //           title: 'Notifications',
                    //           primaryColor: primaryColor,
                    //           textSecondaryColor: textSecondaryColor,
                    //           hasArrow: true,
                    //           isSmallScreen: isSmallScreen,
                    //         ),
                    //         AccountItem(
                    //           icon: Icons.settings_outlined,
                    //           title: 'Settings',
                    //           primaryColor: primaryColor,
                    //           textSecondaryColor: textSecondaryColor,
                    //           hasArrow: true,
                    //           isSmallScreen: isSmallScreen,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: sectionSpacing),

                    // Support Section
                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: cardColor,
                    //     borderRadius: BorderRadius.circular(16),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withValues(alpha: 0.05),
                    //         blurRadius: 8,
                    //         offset: const Offset(0, 2),
                    //       ),
                    //     ],
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Support',
                    //           style: TextStyle(
                    //             fontSize: sectionFontSize,
                    //             fontWeight: FontWeight.bold,
                    //             color: textPrimaryColor,
                    //           ),
                    //         ),
                    //         SizedBox(height: isSmallScreen ? 16 : 20),
                    //         AccountItem(
                    //           icon: Icons.help_outline_outlined,
                    //           title: 'Help Center',
                    //           primaryColor: primaryColor,
                    //           textSecondaryColor: textSecondaryColor,
                    //           hasArrow: true,
                    //           isSmallScreen: isSmallScreen,
                    //         ),
                    //         AccountItem(
                    //           icon: Icons.chat_bubble_outline_outlined,
                    //           title: 'Contact Us',
                    //           primaryColor: primaryColor,
                    //           textSecondaryColor: textSecondaryColor,
                    //           hasArrow: true,
                    //           isSmallScreen: isSmallScreen,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 80), // Space for bottom navigation
                  ],
                ),
              ),
            ),
          ),
          UserProfileError(:final message) => CustomErrorWidget(
            errorMessage: message,
            isDark: isDark,
            onRetry: _profileWidgetHelper.userProfileInit,
          ),
        };
      },
    );
  }
}
