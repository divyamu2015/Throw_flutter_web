import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class CustomAlertDialog {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    String? message,
    String? subMessage,
    Widget? icon,
    Color? iconColor,
    Color? iconBackgroundColor,
    required String confirmButtonText,
    Color? confirmButtonColor,
    Color? confirmButtonTextColor,
    String? cancelButtonText,
    Color? cancelButtonColor,
    Color? cancelButtonTextColor,
    bool showCancelButton = true,
    bool barrierDismissible = false,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Widget? customContent,
    double? dialogWidth,
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return _CustomAlertDialog(
          title: title,
          message: message,
          subMessage: subMessage,
          icon: icon,
          iconColor: iconColor ?? primaryColor,
          iconBackgroundColor:
              iconBackgroundColor ?? primaryColor.withValues(alpha: 0.1),
          confirmButtonText: confirmButtonText,
          confirmButtonColor: confirmButtonColor ?? primaryColor,
          confirmButtonTextColor: confirmButtonTextColor ?? AppColors.cardLight,
          cancelButtonText: cancelButtonText ?? 'Cancel',
          cancelButtonColor: cancelButtonColor,
          cancelButtonTextColor:
              cancelButtonTextColor ?? AppColors.getTextSecondaryColor(isDark),
          showCancelButton: showCancelButton,
          onConfirm: onConfirm,
          onCancel: onCancel,
          customContent: customContent,
          dialogWidth: dialogWidth,
        );
      },
    );
  }
}

class _CustomAlertDialog extends StatefulWidget {
  final String title;
  final String? message;
  final String? subMessage;
  final Widget? icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String confirmButtonText;
  final Color confirmButtonColor;
  final Color confirmButtonTextColor;
  final String cancelButtonText;
  final Color? cancelButtonColor;
  final Color cancelButtonTextColor;
  final bool showCancelButton;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? customContent;
  final double? dialogWidth;

  const _CustomAlertDialog({
    required this.title,
    this.message,
    this.subMessage,
    this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.confirmButtonText,
    required this.confirmButtonColor,
    required this.confirmButtonTextColor,
    required this.cancelButtonText,
    this.cancelButtonColor,
    required this.cancelButtonTextColor,
    required this.showCancelButton,
    this.onConfirm,
    this.onCancel,
    this.customContent,
    this.dialogWidth,
  });

  @override
  State<_CustomAlertDialog> createState() => __CustomAlertDialogState();
}

class __CustomAlertDialogState extends State<_CustomAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleConfirm() {
    Navigator.of(context).pop();
    widget.onConfirm?.call();
  }

  void _handleCancel() {
    Navigator.of(context).pop();
    widget.onCancel?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const backgroundDark = AppColors.backgroundDark;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            width: widget.dialogWidth,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? backgroundDark : AppColors.cardLight,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Icon (optional)
                if (widget.icon != null) ...[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: widget.iconBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconTheme(
                      data: IconThemeData(color: widget.iconColor, size: 40),
                      child: widget.icon!,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

                // Title
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.getTextPrimaryColor(isDark),
                  ),
                ),
                const SizedBox(height: 8),

                // Custom Content (if provided)
                if (widget.customContent != null) ...[
                  widget.customContent!,
                ] else if (widget.message != null) ...[
                  // Message (optional)
                  Text(
                    widget.message!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.getTextSecondaryColor(isDark),
                      height: 1.4,
                    ),
                  ),

                  // Sub Message (optional)
                  if (widget.subMessage != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      widget.subMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey[500] : Colors.grey[500],
                        height: 1.4,
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    // Cancel Button (optional)
                    if (widget.showCancelButton) ...[
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _handleCancel,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(
                              color: AppColors.getBorderColor(isDark),
                            ),
                            backgroundColor: widget.cancelButtonColor,
                          ),
                          child: Text(
                            widget.cancelButtonText,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: widget.cancelButtonTextColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],

                    // Confirm Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _handleConfirm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.confirmButtonColor,
                          foregroundColor: widget.confirmButtonTextColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          shadowColor: widget.confirmButtonColor.withValues(
                            alpha: 0.3,
                          ),
                        ),
                        child: Text(
                          widget.confirmButtonText,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: widget.confirmButtonTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
