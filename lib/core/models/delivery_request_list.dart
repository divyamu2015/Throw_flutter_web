import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryRequest {
  final String id; // Firestore document ID

  final String deliveryRequestId;
  final String customerName;
  final String pickupAddress;
  final String dropOffAddress;
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
    required this.pickupAddress,
    required this.dropOffAddress,
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
    required this.userId,
    required this.pickupDate,
    required this.dropOffDate,
    required this.createdAt,
    required this.updatedAt,
    required this.auctionStartingTime,
  });

  /// ✅ Create object FROM Firestore
  factory DeliveryRequest.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return DeliveryRequest(
      id: documentId,
      deliveryRequestId: data['deliveryRequestId'] ?? '',
      customerName: data['customerName'] ?? '',
      pickupAddress: data['pickupAddress'] ?? '',
      dropOffAddress: data['dropOffAddress'] ?? '',
      packageType: data['packageType'] ?? '',
      packageWeight: (data['packageWeight'] ?? 0).toDouble(),
      agreedDeliveryCharge:
          (data['agreedDeliveryCharge'] ?? 0).toDouble(),
      baseDeliveryCharge:
          (data['baseDeliveryCharge'] ?? 0).toDouble(),
      minimumDeliveryCharge:
          (data['minimumDeliveryCharge'] ?? 0).toDouble(),
      deliveryStatus: data['deliveryStatus'] ?? '',
      requestStatus: data['requestStatus'] ?? '',
      paymentStatus: data['paymentStatus'] ?? '',
      deliveryAgentId: data['deliveryAgentId'] ?? '',
      urgency: data['urgency'] ?? '',
      userId: data['userId'] ?? '',
      pickupDate:
          (data['pickupDate'] as Timestamp?)?.toDate() ??
              DateTime.now(),
      dropOffDate:
          (data['dropOffDate'] as Timestamp?)?.toDate() ??
              DateTime.now(),
      createdAt:
          (data['createdAt'] as Timestamp?)?.toDate() ??
              DateTime.now(),
      updatedAt:
          (data['updatedAt'] as Timestamp?)?.toDate() ??
              DateTime.now(),
      auctionStartingTime:
          (data['auctionStartingTime'] as Timestamp?)?.toDate() ??
              DateTime.now(),
    );
  }

  /// ✅ Convert object TO Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'deliveryRequestId': deliveryRequestId,
      'customerName': customerName,
      'pickupAddress': pickupAddress,
      'dropOffAddress': dropOffAddress,
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
      'userId': userId,
      'pickupDate': Timestamp.fromDate(pickupDate),
      'dropOffDate': Timestamp.fromDate(dropOffDate),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'auctionStartingTime':
          Timestamp.fromDate(auctionStartingTime),
    };
  }
}
