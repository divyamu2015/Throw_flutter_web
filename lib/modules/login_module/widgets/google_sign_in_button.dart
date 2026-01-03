import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_app/core/bloc/auth/auth_bloc.dart';
import 'package:throw_app/core/constants/app_colors.dart';

class GoogleSignInButton extends StatelessWidget {
  final bool isDarkMode;

  const GoogleSignInButton({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDarkMode ? const Color(0xFF1F2937) : Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        onTap: () {
          // Trigger Google sign in via AuthBloc
          context.read<AuthBloc>().add(const SignInWithGoogle());
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 56,
          // padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: isDarkMode
                  ? const Color(0xFF374151)
                  : const Color(0xFFE5E7EB),
              width: 1,
            ),
            boxShadow: isDarkMode
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Stack(
            children: [
              // Hover effect
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppColors.primary.withValues(alpha: 0.05),
                  ),
                ),
              ),

              // Button content
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Google icon
                    Image.asset(
                      'assets/icons/icons8-google-48.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback icon if asset not found
                        return const Icon(
                          Icons.g_mobiledata,
                          size: 24,
                          color: Colors.grey,
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode
                            ? Colors.white
                            : const Color.fromARGB(255, 64, 76, 95),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
