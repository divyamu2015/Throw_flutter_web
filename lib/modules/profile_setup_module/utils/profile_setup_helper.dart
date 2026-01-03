// profile_setup_helper.dart - Updated for utility functions only
class ProfileSetupHelper {
  static double getResponsivePadding(double screenWidth) {
    if (screenWidth < 375) return 16;
    if (screenWidth < 600) return 24;
    if (screenWidth < 900) return 32;
    return 48;
  }

  static double getResponsiveVerticalPadding(double screenHeight) {
    if (screenHeight < 700) return 16;
    if (screenHeight < 900) return 20;
    return 24;
  }

  static double getFieldSpacing(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }

  static double getButtonPadding(double screenWidth) {
    if (screenWidth < 375) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 24;
    return 28;
  }

  static double getButtonHeight(double screenWidth) {
    if (screenWidth < 375) return 48;
    if (screenWidth < 600) return 52;
    if (screenWidth < 900) return 56;
    return 60;
  }

  static double getFontSize(double screenWidth) {
    if (screenWidth < 375) return 15;
    if (screenWidth < 600) return 16;
    if (screenWidth < 900) return 17;
    return 18;
  }
}
