import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_app/core/models/auth_response.dart';
import 'package:throw_app/core/repository/user_repository.dart';
import 'package:throw_app/core/service/auth_service.dart';
import 'package:throw_app/core/storage/auth_storage_functions.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final AuthStorageFunctions _authStorageFunctions;
  final UserRepository _userRepository;

  AuthBloc({
    required AuthService authService,
    required AuthStorageFunctions authStorageFunctions,
    required UserRepository userRepository,
  }) : _authService = authService,
       _authStorageFunctions = authStorageFunctions,
       _userRepository = userRepository,
       super(const AuthState.initial()) {
    on<CheckAuthStatus>(_checkAuthStatus);
    on<SignInWithGoogle>(_signInWithGoogle);
    on<TrySilentSignIn>(_trySilentSignIn);
    on<SignOut>(_signOut);
    on<ResetError>(_resetError);
  }

  Future<void> _checkAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final isSignedIn = await _authService.isSignedIn();

      if (isSignedIn) {
        final user = await _authService.getCurrentUser();
        if (user != null) {
          debugPrint(user.toString());
          await _userRepository.createOrUpdateUser(user);
          emit(AuthState.authenticated(user: user));
        } else {
          debugPrint('User not signed in.');
          emit(const AuthState.unauthenticated());
        }
      } else {
        // Try silent sign-in if not signed in
        debugPrint('User not signed in. Trying silent sign-in.');
        add(const AuthEvent.trySilentSignIn());
      }
    } catch (e) {
      debugPrint('Failed to check auth status: $e');
      emit(
        AuthState.error(
          message: 'Failed to check auth status',
          details: e.toString(),
        ),
      );
    }
  }

  Future<void> _signInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final response = await _authService.signInWithGoogle();

      await response.when(
        success: (user, token) async {
          // SAVE USER TO FIRESTORE HERE
          try {
            await _userRepository.createOrUpdateUser(user);
          } catch (e) {
            debugPrint('Failed to save user to Firestore: $e');
            // Continue with auth even if Firestore save fails
            // rethrow; // Removed rethrow to allow login to proceed
          }

          // Save user to storage
          final authResponse = AuthResponse.success(user: user, token: token);
          await _authStorageFunctions.saveUid(authResponse);
          emit(AuthState.authenticated(user: user));
        },
        error: (code, message, details) async {
          debugPrint('Sign-in error: $message');
          debugPrint('Sign-in error details: $details');
          emit(AuthState.error(message: message, details: details, code: code));
        },
        cancelled: () async {
          debugPrint('Sign-in cancelled');
          emit(const AuthState.unauthenticated());
        },
      );
    } catch (e) {
      debugPrint('Sign-in error: ${e.toString()}');
      emit(
        AuthState.error(
          message: 'An unexpected error occurred',
          details: e.toString(),
        ),
      );
    }
  }

  Future<void> _trySilentSignIn(
    TrySilentSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final response = await _authService.trySilentSignIn();

      await response.when(
        success: (user, token) async {
          // SAVE USER TO FIRESTORE HERE
          try {
            await _userRepository.createOrUpdateUser(user);
          } catch (e) {
            debugPrint('Failed to save user to Firestore: $e');
            // Continue with auth even if Firestore save fails
            // rethrow; // Removed rethrow to allow login to proceed
          }

          // Save user to storage
          final authResponse = AuthResponse.success(user: user, token: token);
          await _authStorageFunctions.saveUid(authResponse);
          emit(AuthState.authenticated(user: user));
        },
        error: (code, message, details) async {
          // Silent sign-in failed, just stay in unauthenticated state
          emit(const AuthState.unauthenticated());
        },
        cancelled: () async {
          emit(const AuthState.unauthenticated());
        },
      );
    } catch (e) {
      // Silent sign-in failed, just stay in unauthenticated state
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      await _authService.signOut();
      // Clear user from storage
      await _authStorageFunctions.clear();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(
        AuthState.error(message: 'Failed to sign out', details: e.toString()),
      );
      // Even if error, user is effectively logged out locally
      await _authStorageFunctions.clear(); // Still clear storage
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _resetError(ResetError event, Emitter<AuthState> emit) async {
    // If currently authenticated, stay authenticated
    if (state is Authenticated) {
      final authenticatedState = state as Authenticated;
      emit(AuthState.authenticated(user: authenticatedState.user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }
}
