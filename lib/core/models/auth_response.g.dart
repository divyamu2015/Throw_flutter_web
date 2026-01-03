// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  uid: json['uid'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  emailVerified: json['emailVerified'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'emailVerified': instance.emailVerified,
      'createdAt': instance.createdAt.toIso8601String(),
    };

AuthSuccess _$AuthSuccessFromJson(Map<String, dynamic> json) => AuthSuccess(
  user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AuthSuccessToJson(AuthSuccess instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'runtimeType': instance.$type,
    };

AuthError _$AuthErrorFromJson(Map<String, dynamic> json) => AuthError(
  code: json['code'] as String,
  message: json['message'] as String,
  details: json['details'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AuthErrorToJson(AuthError instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'details': instance.details,
  'runtimeType': instance.$type,
};

AuthCancelled _$AuthCancelledFromJson(Map<String, dynamic> json) =>
    AuthCancelled($type: json['runtimeType'] as String?);

Map<String, dynamic> _$AuthCancelledToJson(AuthCancelled instance) =>
    <String, dynamic>{'runtimeType': instance.$type};
