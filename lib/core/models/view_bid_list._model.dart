import 'package:cloud_firestore/cloud_firestore.dart';

class BidModel {
  final String id; // Firestore document id

  final String agentAvatarUrl;
  final double agentAverageRating;
  final String agentId;
  final String agentName;

  final double bargainAmount;
  final double bidAmount;

  final String bidId;
  final String bidStatus;

  final DateTime createdAt;
  final DateTime updatedAt;

  BidModel({
    required this.id,
    required this.agentAvatarUrl,
    required this.agentAverageRating,
    required this.agentId,
    required this.agentName,
    required this.bargainAmount,
    required this.bidAmount,
    required this.bidId,
    required this.bidStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  /// ✅ FROM FIRESTORE
  factory BidModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return BidModel(
      id: documentId,
      agentAvatarUrl: data['agentAvatarUrl'] ?? '',
      agentAverageRating: (data['agentAverageRating'] ?? 0).toDouble(),
      agentId: data['agentId'] ?? '',
      agentName: data['agentName'] ?? '',
      bargainAmount: (data['bargainAmount'] ?? 0).toDouble(),
      bidAmount: (data['bidAmount'] ?? 0).toDouble(),
      bidId: data['bidId'] ?? '',
      bidStatus: data['bidStatus'] ?? 'pending',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  /// ✅ TO FIRESTORE
  Map<String, dynamic> toFirestore() {
    return {
      'agentAvatarUrl': agentAvatarUrl,
      'agentAverageRating': agentAverageRating,
      'agentId': agentId,
      'agentName': agentName,
      'bargainAmount': bargainAmount,
      'bidAmount': bidAmount,
      'bidId': bidId,
      'bidStatus': bidStatus,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
