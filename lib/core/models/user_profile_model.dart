// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  final String displayName;
  final String email;
  final String phoneNumber;
  final String photoUrl;
  final String uid;
  final String userType;

  const UserProfileModel({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.uid,
    required this.userType,
  });

  UserProfileModel copyWith({
    String? displayName,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    String? uid,
    String? userType,
  }) => UserProfileModel(
    displayName: displayName ?? this.displayName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    photoUrl: photoUrl ?? this.photoUrl,
    uid: uid ?? this.uid,
    userType: userType ?? this.userType,
  );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        displayName: json['displayName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        photoUrl: json['photoUrl'],
        uid: json['uid'],
        userType: json['userType'],
      );

  Map<String, dynamic> toJson() => {
    'displayName': displayName,
    'email': email,
    'phoneNumber': phoneNumber,
    'photoUrl': photoUrl,
    'uid': uid,
    'userType': userType,
  };
}
