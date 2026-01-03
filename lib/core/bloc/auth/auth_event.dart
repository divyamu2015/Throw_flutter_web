part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;
  const factory AuthEvent.signInWithGoogle() = SignInWithGoogle;
  const factory AuthEvent.trySilentSignIn() = TrySilentSignIn;
  const factory AuthEvent.signOut() = SignOut;
  const factory AuthEvent.resetError() = ResetError;
}
