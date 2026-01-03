import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryAgent {
  final String id; // Firestore document ID
  final String uid;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String photoUrl;

  final String status; // approved / pending / suspended
  final bool hasApproved;
  final bool hasDocumentUploaded;
  final bool hasVehicleRegistered;

  final String licenseImageUrl;
  final String vehicleType;
  final String vehicleModel;
  final String vehicleNumber;

  final double averageRating;
  final int numberOfRatings;

  final DateTime createdAt;
  final DateTime updatedAt;

  DeliveryAgent({
    required this.id,
    required this.uid,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.status,
    required this.hasApproved,
    required this.hasDocumentUploaded,
    required this.hasVehicleRegistered,
    required this.licenseImageUrl,
    required this.vehicleType,
    required this.vehicleModel,
    required this.vehicleNumber,
    required this.averageRating,
    required this.numberOfRatings,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 🔹 Create object FROM Firestore
  factory DeliveryAgent.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return DeliveryAgent(
      id: documentId,
      uid: data['uid'] ?? '',
      displayName: data['displayName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      photoUrl: data['photoUrl'] ?? '',

      status: data['status'] ?? 'pending',
      hasApproved: data['hasApproved'] ?? false,
      hasDocumentUploaded: data['hasDocumentUploaded'] ?? false,
      hasVehicleRegistered: data['hasVehicleRegistered'] ?? false,

      licenseImageUrl: data['licenseImageUrl'] ?? '',
      vehicleType: data['vehicleType'] ?? '',
      vehicleModel: data['vehicleModel'] ?? '',
      vehicleNumber: data['vehicleNumber'] ?? '',

      averageRating:
          (data['averageRating'] ?? 0).toDouble(),
      numberOfRatings:
          (data['numberOfRatings'] ?? 0).toInt(),

      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ??
          DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ??
          DateTime.now(),
    );
  }

  /// 🔹 Convert object TO Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,

      'status': status,
      'hasApproved': hasApproved,
      'hasDocumentUploaded': hasDocumentUploaded,
      'hasVehicleRegistered': hasVehicleRegistered,

      'licenseImageUrl': licenseImageUrl,
      'vehicleType': vehicleType,
      'vehicleModel': vehicleModel,
      'vehicleNumber': vehicleNumber,

      'averageRating': averageRating,
      'numberOfRatings': numberOfRatings,

      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
