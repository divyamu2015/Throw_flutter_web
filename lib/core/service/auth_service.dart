import 'package:firebase_auth/firebase_auth.dart';
import 'package:throw_app/core/models/auth_response.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Firebase restores session automatically on Web
  Future<void> initialize() async {}

  /// ✅ CHECK IF USER IS SIGNED IN
  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }

  /// ✅ GET CURRENT USER (used by CheckAuthStatus)
  Future<UserProfile?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return UserProfile(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? 'User',
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
      emailVerified: user.emailVerified,
      createdAt: user.metadata.creationTime ?? DateTime.now(),
    );
  }

  /// ✅ SILENT SIGN-IN (Web = already handled by Firebase)
  Future<AuthResponse> trySilentSignIn() async {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      return const AuthResponse.cancelled();
    }

    final token = await user.getIdToken();

    return AuthResponse.success(
      user: UserProfile(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName ?? 'User',
        photoUrl: user.photoURL,
        phoneNumber: user.phoneNumber,
        emailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime ?? DateTime.now(),
      ),
      token: token!,
    );
  }

  /// ✅ GOOGLE SIGN-IN (WEB)
  Future<AuthResponse> signInWithGoogle() async {
    try {
      final googleProvider = GoogleAuthProvider();

      final userCredential =
          await _firebaseAuth.signInWithPopup(googleProvider);

      final user = userCredential.user;
      if (user == null) {
        return const AuthResponse.error(
          code: 'no-user',
          message: 'No user returned',
        );
      }

      final token = await user.getIdToken();

      return AuthResponse.success(
        user: UserProfile(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName ?? 'User',
          photoUrl: user.photoURL,
          phoneNumber: user.phoneNumber,
          emailVerified: user.emailVerified,
          createdAt: user.metadata.creationTime ?? DateTime.now(),
        ),
        token: token!,
      );
    } catch (e) {
      return AuthResponse.error(
        code: 'google-signin-failed',
        message: 'Google Sign-In failed',
        details: e.toString(),
      );
    }
  }

  /// ✅ SIGN OUT
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
