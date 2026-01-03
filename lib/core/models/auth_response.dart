import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String email,
    required String displayName,
    String? photoUrl,
    String? phoneNumber,
    required bool emailVerified,
    required DateTime createdAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
sealed class AuthResponse with _$AuthResponse {
  const factory AuthResponse.success({
    required UserProfile user,
    required String token,
  }) = AuthSuccess;

  const factory AuthResponse.error({
    required String code,
    required String message,
    String? details,
  }) = AuthError;

  const factory AuthResponse.cancelled() = AuthCancelled;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
