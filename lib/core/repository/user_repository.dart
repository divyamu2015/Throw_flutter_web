import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_app/core/models/auth_response.dart';
import 'package:throw_app/core/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  // Collection reference
  static const String usersCollection = 'users';

  // Create or update user in Firestore
  Future<void> createOrUpdateUser(UserProfile userProfile) async {
    try {
      final userData = {
        'uid': userProfile.uid,
        'displayName': userProfile.displayName,
        'email': userProfile.email,
        'phoneNumber': userProfile.phoneNumber ?? '',
        'photoUrl': userProfile.photoUrl ?? '',
        'userType': 'admin',
      };

      // Use UID as document ID for easy lookup
      await _firestore
          .collection(usersCollection)
          .doc(userProfile.uid)
          .set(
            userData,
            SetOptions(merge: true),
          ); // merge: true updates instead of overwriting
    } catch (e) {
      debugPrint('Error saving user to Firestore: $e');
      rethrow;
    }
  }

  // Get user by UID
  Future<UserProfileModel?> getUserByUid(String uid) async {
    try {
      final doc = await _firestore.collection(usersCollection).doc(uid).get();

      return doc.exists ? UserProfileModel.fromJson(doc.data()!) : null;
    } catch (e) {
      debugPrint('Error getting user: $e');
      return null;
    }
  }

  // Check if user exists in database
  Future<bool> userExists(String uid) async {
    try {
      final doc = await _firestore.collection(usersCollection).doc(uid).get();

      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}
