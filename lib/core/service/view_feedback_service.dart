import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/models/view_feedback_model.dart';

class ViewFeedbackService {
  final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String collection = 'feedback';

  Stream<List<FeedbackModel>> getAllFeedback() {
    return _db
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => FeedbackModel.fromFirestore(doc.data(), doc.id))
              .toList(),
        );
  }
}
