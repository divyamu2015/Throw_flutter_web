import 'package:flutter/material.dart';

/// Centralized color constants for the entire application.
/// This class provides a single source of truth for all color schemes
/// used across different modules, supporting both light and dark themes.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ============================================================================
  // PRIMARY COLORS
  // ============================================================================

  /// Primary brand color - Blue
  static const Color primary = Color(0xFF2694ED);

  /// Success color - Green
  static const Color success = Color(0xFF10B981);

  /// Error color - Red
  static const Color error = Colors.red;

  // ============================================================================
  // BACKGROUND COLORS
  // ============================================================================

  /// Light theme background color
  static const Color backgroundLight = Color(0xFFF6F7F8);

  /// Dark theme background color
  static const Color backgroundDark = Color(0xFF101A22);

  // ============================================================================
  // CARD COLORS
  // ============================================================================

  /// Light theme card color
  static const Color cardLight = Colors.white;

  /// Dark theme card color
  static const Color cardDark = Color(0xFF182430);

  // ============================================================================
  // TEXT COLORS
  // ============================================================================

  /// Primary text color for light theme
  static const Color textPrimaryLight = Color(0xFF111518);

  /// Primary text color for dark theme
  static const Color textPrimaryDark = Color(0xFFF6F7F8);

  /// Secondary text color for light theme
  static const Color textSecondaryLight = Color(0xFF617789);

  /// Secondary text color for dark theme
  static const Color textSecondaryDark = Color(0xFF9BADBD);

  // ============================================================================
  // INPUT FIELD COLORS
  // ============================================================================

  /// Input field background for light theme (profile style)
  static const Color inputBackgroundLightProfile = Color(0xFFE7EEF3);

  /// Input field background for dark theme (profile style)
  static const Color inputBackgroundDarkProfile = Color(0xFF1C2A38);

  /// Input field background for dark theme (delivery style)
  static const Color inputBackgroundDarkDelivery = Color(0xFF182430);

  /// Input field hint color for light theme (profile style)
  static const Color inputHintLightProfile = Color(0xFF4C779A);

  /// Input field hint color for dark theme (profile style)
  static const Color inputHintDarkProfile = Color(0xFFA0B3C4);

  /// Input field hint color for dark theme (delivery style)
  static const Color inputHintDarkDelivery = Color(0xFF9BADBD);

  /// Input field text color for light theme (profile style)
  static const Color inputTextLightProfile = Color(0xFF0D151B);

  // ============================================================================
  // BORDER & DIVIDER COLORS
  // ============================================================================

  /// Border color for light theme
  static const Color borderLight = Color(0xFFE5E7EB);

  /// Border color for dark theme
  static const Color borderDark = Color(0xFF374151);

  /// Divider color for light theme
  static const Color dividerLight = Color(0xFFE5E7EB);

  /// Divider color for dark theme
  static const Color dividerDark = Color(0xFF374151);

  // ============================================================================
  // UTILITY COLORS
  // ============================================================================

  /// Gray color for inactive/disabled states (light theme)
  static const Color grayLight = Color(0xFF6B7280);

  /// Gray color for inactive/disabled states (dark theme)
  static const Color grayDark = Color(0xFF9CA3AF);

  /// Background for inactive elements (light theme)
  static const Color inactiveBackgroundLight = Color(0xFFF3F4F6);

  /// Background for inactive elements (dark theme)
  static const Color inactiveBackgroundDark = Color(0xFF1F2937);

  // ============================================================================
  // PHONE FIELD SPECIFIC COLORS
  // ============================================================================

  /// Phone field background for light theme
  static const Color phoneFieldBackgroundLight = Color(0xFFF6F7F8);

  /// Phone field background for dark theme
  static const Color phoneFieldBackgroundDark = Color(0xFF1F2937);

  // ============================================================================
  // SNACKBAR COLORS
  // ============================================================================

  // Success
  static const Color snackbarSuccessBackgroundLight = Color(0xFFF0FDF4);
  static const Color snackbarSuccessBackgroundDark = Color(0xFF052E16);
  static const Color snackbarSuccessTextLight = Color(0xFF166534);
  static const Color snackbarSuccessTextDark = Color(0xFFBBF7D0);
  static const Color snackbarSuccessIconLight = Color(0xFF16A34A);
  static const Color snackbarSuccessIconDark = Color(0xFF4ADE80);

  // Error
  static const Color snackbarErrorBackgroundLight = Color(0xFFFEF2F2);
  static const Color snackbarErrorBackgroundDark = Color(0xFF450A0A);
  static const Color snackbarErrorTextLight = Color(0xFF991B1B);
  static const Color snackbarErrorTextDark = Color(0xFFFECACA);
  static const Color snackbarErrorIconLight = Color(0xFFDC2626);
  static const Color snackbarErrorIconDark = Color(0xFFF87171);

  // Info/Normal
  static const Color snackbarInfoBackgroundLight = Color(0xFFF8FAFC);
  static const Color snackbarInfoBackgroundDark = Color(0xFF1E293B);
  static const Color snackbarInfoTextLight = Color(0xFF475569);
  static const Color snackbarInfoTextDark = Color(0xFFE2E8F0);
  static const Color snackbarInfoIconLight = Color(0xFF3B82F6);
  static const Color snackbarInfoIconDark = Color(0xFF60A5FA);

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Returns the appropriate background color based on theme
  static Color getBackgroundColor(bool isDark) {
    return isDark ? backgroundDark : backgroundLight;
  }

  /// Returns the appropriate card color based on theme
  static Color getCardColor(bool isDark) {
    return isDark ? cardDark : cardLight;
  }

  /// Returns the appropriate primary text color based on theme
  static Color getTextPrimaryColor(bool isDark) {
    return isDark ? textPrimaryDark : textPrimaryLight;
  }

  /// Returns the appropriate secondary text color based on theme
  static Color getTextSecondaryColor(bool isDark) {
    return isDark ? textSecondaryDark : textSecondaryLight;
  }

  /// Returns the appropriate border color based on theme
  static Color getBorderColor(bool isDark) {
    return isDark ? borderDark : borderLight;
  }

  /// Returns the appropriate divider color based on theme
  static Color getDividerColor(bool isDark) {
    return isDark ? dividerDark : dividerLight;
  }

  /// Returns the appropriate gray color based on theme
  static Color getGrayColor(bool isDark) {
    return isDark ? grayDark : grayLight;
  }

  /// Returns the appropriate inactive background color based on theme
  static Color getInactiveBackgroundColor(bool isDark) {
    return isDark ? inactiveBackgroundDark : inactiveBackgroundLight;
  }

  /// Returns the appropriate input background color for profile style
  static Color getInputBackgroundProfile(bool isDark) {
    return isDark ? inputBackgroundDarkProfile : inputBackgroundLightProfile;
  }

  /// Returns the appropriate input hint color for profile style
  static Color getInputHintProfile(bool isDark) {
    return isDark ? inputHintDarkProfile : inputHintLightProfile;
  }

  /// Returns the appropriate phone field background color
  static Color getPhoneFieldBackground(bool isDark) {
    return isDark ? phoneFieldBackgroundDark : phoneFieldBackgroundLight;
  }
}
