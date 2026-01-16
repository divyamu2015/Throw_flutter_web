import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryRequest {
  final String id; // Firestore document ID

  final String deliveryRequestId;
  final String customerName;
  final String customerAvatarUrl;

  final String pickupAddress;
  final String dropOffAddress;

  final String pickupPhoneNumber;
  final String dropOffPhoneNumber;

  final String pickupRemarks;
  final String dropOffRemarks;

  final GeoPoint pickupLocation;
  final GeoPoint deliveryLocation;

  final String packageType;
  final double packageWeight;

  final double agreedDeliveryCharge;
  final double baseDeliveryCharge;
  final double minimumDeliveryCharge;

  final String deliveryStatus;
  final String requestStatus;
  final String paymentStatus;

  final String deliveryAgentId;
  final String urgency;
  final String preferredDeliveryTime;
  final String userId;

  final DateTime pickupDate;
  final DateTime dropOffDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime auctionStartingTime;

  DeliveryRequest({
    required this.id,
    required this.deliveryRequestId,
    required this.customerName,
    required this.customerAvatarUrl,
    required this.pickupAddress,
    required this.dropOffAddress,
    required this.pickupPhoneNumber,
    required this.dropOffPhoneNumber,
    required this.pickupRemarks,
    required this.dropOffRemarks,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.packageType,
    required this.packageWeight,
    required this.agreedDeliveryCharge,
    required this.baseDeliveryCharge,
    required this.minimumDeliveryCharge,
    required this.deliveryStatus,
    required this.requestStatus,
    required this.paymentStatus,
    required this.deliveryAgentId,
    required this.urgency,
    required this.preferredDeliveryTime,
    required this.userId,
    required this.pickupDate,
    required this.dropOffDate,
    required this.createdAt,
    required this.updatedAt,
    required this.auctionStartingTime,
  });

  /// ✅ FROM FIRESTORE
  factory DeliveryRequest.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return DeliveryRequest(
      id: documentId,
      deliveryRequestId: data['deliveryRequestId'] ?? '',
      customerName: data['customerName'] ?? '',
      customerAvatarUrl: data['customerAvatarUrl'] ?? '',

      pickupAddress: data['pickupAddress'] ?? '',
      dropOffAddress: data['dropOffAddress'] ?? '',

      pickupPhoneNumber: data['pickupPhoneNumber'] ?? '',
      dropOffPhoneNumber: data['dropOffPhoneNumber'] ?? '',

      pickupRemarks: data['pickupRemarks'] ?? '',
      dropOffRemarks: data['dropOffRemarks'] ?? '',

      pickupLocation: data['pickupLocation'] ?? const GeoPoint(0, 0),
      deliveryLocation: data['deliveryLocation'] ?? const GeoPoint(0, 0),

      packageType: data['packageType'] ?? '',
      packageWeight: (data['packageWeight'] ?? 0).toDouble(),

      agreedDeliveryCharge: (data['agreedDeliveryCharge'] ?? 0).toDouble(),
      baseDeliveryCharge: (data['baseDeliveryCharge'] ?? 0).toDouble(),
      minimumDeliveryCharge: (data['minimumDeliveryCharge'] ?? 0).toDouble(),

      deliveryStatus: data['deliveryStatus'] ?? '',
      requestStatus: data['requestStatus'] ?? '',
      paymentStatus: data['paymentStatus'] ?? '',

      deliveryAgentId: data['deliveryAgentId'] ?? '',
      urgency: data['urgency'] ?? '',
      preferredDeliveryTime: data['preferredDeliveryTime'] ?? '',
      userId: data['userId'] ?? '',

      pickupDate:
          (data['pickupDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      dropOffDate:
          (data['dropOffDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      createdAt:
          (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt:
          (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      auctionStartingTime:
          (data['auctionStartingTime'] as Timestamp?)?.toDate() ??
              DateTime.now(),
    );
  }

  /// ✅ TO FIRESTORE
  Map<String, dynamic> toFirestore() {
    return {
      'deliveryRequestId': deliveryRequestId,
      'customerName': customerName,
      'customerAvatarUrl': customerAvatarUrl,

      'pickupAddress': pickupAddress,
      'dropOffAddress': dropOffAddress,

      'pickupPhoneNumber': pickupPhoneNumber,
      'dropOffPhoneNumber': dropOffPhoneNumber,

      'pickupRemarks': pickupRemarks,
      'dropOffRemarks': dropOffRemarks,

      'pickupLocation': pickupLocation,
      'deliveryLocation': deliveryLocation,

      'packageType': packageType,
      'packageWeight': packageWeight,

      'agreedDeliveryCharge': agreedDeliveryCharge,
      'baseDeliveryCharge': baseDeliveryCharge,
      'minimumDeliveryCharge': minimumDeliveryCharge,

      'deliveryStatus': deliveryStatus,
      'requestStatus': requestStatus,
      'paymentStatus': paymentStatus,

      'deliveryAgentId': deliveryAgentId,
      'urgency': urgency,
      'preferredDeliveryTime': preferredDeliveryTime,
      'userId': userId,

      'pickupDate': Timestamp.fromDate(pickupDate),
      'dropOffDate': Timestamp.fromDate(dropOffDate),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'auctionStartingTime': Timestamp.fromDate(auctionStartingTime),
    };
  }
}
   