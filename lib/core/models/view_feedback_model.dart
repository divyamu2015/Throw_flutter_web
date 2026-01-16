import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackModel {
  final String id; // Firestore document ID

  final String comments;
  final int rating;
  final String userName;
  final String userAvatarImageUrl;
  final String deliveryAgentUid;
  final DocumentReference deliveryRequestRef;
  final DateTime createdAt;

  FeedbackModel({
    required this.id,
    required this.comments,
    required this.rating,
    required this.userName,
    required this.userAvatarImageUrl,
    required this.deliveryAgentUid,
    required this.deliveryRequestRef,
    required this.createdAt,
  });

  /// Create object FROM Firestore
  factory FeedbackModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return FeedbackModel(
      id: documentId,
      comments: data['comments'] ?? '',
      rating: (data['rating'] ?? 0),
      userName: data['userName'] ?? '',
      userAvatarImageUrl: data['userAvatarImageUrl'] ?? '',
      deliveryAgentUid: data['deliveryAgentUid'] ?? '',
      deliveryRequestRef: data['deliveryRequestRef'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  /// Convert object TO Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'comments': comments,
      'rating': rating,
      'userName': userName,
      'userAvatarImageUrl': userAvatarImageUrl,
      'deliveryAgentUid': deliveryAgentUid,
      'deliveryRequestRef': deliveryRequestRef,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
