// profile_setup_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/core/widgets/text_field/unified_text_field.dart';
import 'package:throw_app/modules/profile_setup_module/providers/profile_setup_provider.dart';
import 'package:throw_app/modules/profile_setup_module/utils/profile_setup_helper.dart';
import 'package:throw_app/modules/profile_setup_module/widgets/continue_button.dart';
import 'package:throw_app/modules/profile_setup_module/widgets/profile_image_section.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => const ProfileSetupPage());
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width >= 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    // Color definitions
    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final cardColor = AppColors.getCardColor(isDark);
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);

    // Responsive padding calculations
    final horizontalPadding = ProfileSetupHelper.getResponsivePadding(
      screenSize.width,
    );
    final verticalPadding = ProfileSetupHelper.getResponsiveVerticalPadding(
      screenSize.height,
    );

    return ChangeNotifierProvider(
      create: (context) => ProfileSetupProvider(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: cardColor,
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          centerTitle: true,
          title: Text(
            'Profile Setup',
            style: TextStyle(
              fontSize: _getTitleFontSize(screenSize.width),
              fontWeight: FontWeight.bold,
              color: textPrimaryColor,
            ),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Consumer<ProfileSetupProvider>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          screenSize.height -
                          (kToolbarHeight + verticalPadding * 2 + 100),
                    ),
                    child: Column(
                      children: [
                        // Profile Photo Section
                        ProfileImageSection(
                          isDark: isDark,
                          screenWidth: screenSize.width,
                          profileImagePath: provider.profileImage?.path,
                          onUploadPressed: provider.pickImage,
                        ),

                        SizedBox(height: isLargeScreen ? 32 : 24),

                        // Form Section
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: isLargeScreen ? 500 : double.infinity,
                          ),
                          child: Column(
                            children: [
                              // Full Name Field
                              UnifiedTextField(
                                controller: provider.fullNameController,
                                hintText: 'Full Name',
                                screenWidth: screenSize.width,
                                isDark: isDark,
                                style: TextFieldStyle.profile,
                                keyboardType: TextInputType.name,
                                validator:
                                    ProfileSetupProvider.validateFullName,
                              ),
                              SizedBox(
                                height: ProfileSetupHelper.getFieldSpacing(
                                  screenSize.width,
                                ),
                              ),

                              // Phone Number Field
                              UnifiedTextField(
                                controller: provider.phoneNumberController,
                                hintText: 'Phone Number',
                                screenWidth: screenSize.width,
                                isDark: isDark,
                                style: TextFieldStyle.profile,
                                keyboardType: TextInputType.phone,
                                validator:
                                    ProfileSetupProvider.validatePhoneNumber,
                              ),
                              SizedBox(
                                height: ProfileSetupHelper.getFieldSpacing(
                                  screenSize.width,
                                ),
                              ),

                              // Email Address Field
                              UnifiedTextField(
                                controller: provider.emailController,
                                hintText: 'Email Address',
                                screenWidth: screenSize.width,
                                isDark: isDark,
                                style: TextFieldStyle.profile,
                                keyboardType: TextInputType.emailAddress,
                                validator: ProfileSetupProvider.validateEmail,
                              ),
                              SizedBox(
                                height: ProfileSetupHelper.getFieldSpacing(
                                  screenSize.width,
                                ),
                              ),

                              // Password Field
                              UnifiedTextField(
                                controller: provider.passwordController,
                                hintText: 'Password',
                                screenWidth: screenSize.width,
                                isDark: isDark,
                                style: TextFieldStyle.profile,
                                obscureText: !provider.isPasswordVisible,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    provider.isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: isDark
                                        ? AppColors.inputHintDarkProfile
                                        : AppColors.inputHintLightProfile,
                                  ),
                                  onPressed: provider.togglePasswordVisibility,
                                ),
                                validator:
                                    ProfileSetupProvider.validatePassword,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // Footer Button
        bottomNavigationBar: Consumer<ProfileSetupProvider>(
          builder: (context, provider, child) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ContinueButton(
                screenWidth: screenSize.width,
                isLoading: provider.isLoading,
                onPressed: () => _submitForm(context, provider),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _submitForm(
    BuildContext context,
    ProfileSetupProvider provider,
  ) async {
    if (_formKey.currentState!.validate()) {
      if (provider.profileImage != null) {
        provider.isLoading = true;

        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));

        if (context.mounted) {
          provider.isLoading = false;

          final String fullName = provider.fullNameController.text.trim();
          final String phoneNumber = provider.phoneNumberController.text.trim();
          final String email = provider.emailController.text.trim();
          final String password = provider.passwordController.text.trim();

          debugPrint('Full name: $fullName');
          debugPrint('Phone number: $phoneNumber');
          debugPrint('Email: $email');
          debugPrint('Password: $password');

          // Use your existing snackbar and navigation logic
          // CustomSnackbar.showSuccess(
          //   context: context,
          //   message: 'Profile set up successfully!',
          // );
          // Navigator.pushAndRemoveUntil(context, LoginPage.route(), (_) => false);
        }
      } else {
        // CustomSnackbar.showError(
        //   context: context,
        //   message: 'Please upload the profile image.',
        // );
      }
    } else {
      // CustomSnackbar.showError(
      //   context: context,
      //   message: 'Please fill all the required form fields',
      // );
    }
  }

  double _getTitleFontSize(double screenWidth) {
    if (screenWidth < 375) return 18;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 22;
    return 24;
  }
}
