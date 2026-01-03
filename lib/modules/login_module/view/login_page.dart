import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_app/core/bloc/auth/auth_bloc.dart';
import 'package:throw_app/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_app/modules/login_module/widgets/login_page_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state) {
          case Authenticated(user: final user):
            debugPrint('User: $user');
            CustomSnackbar.showSuccess(
              context: context,
              message: 'User authenticated successfully.',
            );
            // Navigator.of(
            //   context,
            // ).pushAndRemoveUntil(DashboardPage.route(), (route) => false);
            break;
          case AuthErrorState(
            message: final message,
            details: final details,
            code: _,
          ):
            debugPrint('Auth Error: $message');
            debugPrint('details: $details');
            CustomSnackbar.showError(
              context: context,
              message: details ?? 'Authentication error occurred.',
            );
            break;
          default:
        }
      },
      child: const LoginPageContent(),
    );
  }
}
