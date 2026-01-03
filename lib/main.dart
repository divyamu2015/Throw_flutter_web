import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/bloc/auth/auth_bloc.dart';
import 'package:throw_app/core/constants/app_colors.dart';
import 'package:throw_app/core/repository/user_repository.dart';
import 'package:throw_app/core/service/auth_service.dart';
import 'package:throw_app/core/storage/auth_storage_functions.dart';
import 'package:throw_app/modules/dashboard_module/view/home_screen.dart';
import 'package:throw_app/modules/home_module/cubit/user_profile_cubit.dart';
import 'package:throw_app/modules/login_module/view/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final AuthStorageFunctions authStorageFunctions = AuthStorageFunctions();
    final UserRepository userRepository = UserRepository();

    // Initialize auth service
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   authService.initialize();
    // });

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authService: authService,
            authStorageFunctions: authStorageFunctions,
            userRepository: userRepository,
          )..add(const AuthEvent.checkAuthStatus()),
        ),
        BlocProvider(create: (context) => UserProfileCubit()),
      ],
      child: MaterialApp(
        title: 'Throw',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          cardColor: Colors.white,
          scaffoldBackgroundColor: AppColors.backgroundLight,
          textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
            titleLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            bodyLarge: GoogleFonts.plusJakartaSans(color: Colors.black87),
            bodyMedium: GoogleFonts.plusJakartaSans(color: Colors.grey[700]),
            bodySmall: GoogleFonts.plusJakartaSans(color: Colors.grey[600]),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.backgroundLight.withValues(alpha: 0.8),
            elevation: 0,
            titleTextStyle: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        darkTheme: ThemeData(
          primaryColor: AppColors.primary,
          cardColor: AppColors.cardDark,
          scaffoldBackgroundColor: AppColors.backgroundDark,
          textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
            titleLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyLarge: GoogleFonts.plusJakartaSans(color: Colors.white),
            bodyMedium: GoogleFonts.plusJakartaSans(color: Colors.grey[300]),
            bodySmall: GoogleFonts.plusJakartaSans(color: Colors.grey[400]),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.backgroundDark.withValues(alpha: 0.8),
            elevation: 0,
            titleTextStyle: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    return switch (state) {
      Initial() || Loading() => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),

      Authenticated() => const DashboardPage(),

      Unauthenticated() => const LoginPage(),

      AuthErrorState() => const LoginPage(),
    };
  },
),

      ),
    );
  }
}

