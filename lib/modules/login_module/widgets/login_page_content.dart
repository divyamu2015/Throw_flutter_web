import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_app/core/bloc/auth/auth_bloc.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/modules/login_module/widgets/google_sign_in_button.dart';

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(isDarkMode),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ SizedBox(height: screenHeight * 0.1),
                            Center(
                              child:    Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Icon(Icons.send,
                                    color: Color(0xFF0EA5E9), size: 32),
                                SizedBox(width: 8),
                                Text(
                                  "Throw",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                      ),

                      // Main Content
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth > 600 ? 100 : 24.0,
                            vertical: 32.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Welcome Section
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Welcome to Throw',
                                    style: TextStyle(
                                      fontSize: screenWidth > 600 ? 36 : 28,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.getTextPrimaryColor(
                                        isDarkMode,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Sign in to start sending and receiving packages',
                                    style: TextStyle(
                                      fontSize: screenWidth > 600 ? 16 : 14,
                                      color: AppColors.getTextSecondaryColor(
                                        isDarkMode,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 48),

                              // Google Sign In Button
                              SizedBox(
                                width: screenWidth > 600
                                    ? 400
                                    : double.infinity,
                                child: GoogleSignInButton(
                                  isDarkMode: isDarkMode,
                                ),
                              ),

                              // Show loading indicator when authenticating
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  if (state is Loading) {
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Footer
                      Container(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.getTextSecondaryColor(
                                  isDarkMode,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: 'By continuing, you agree to our ',
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
