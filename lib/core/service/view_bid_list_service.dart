import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/models/view_bid_list._model.dart';

class BidService {
  final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String collection = 'deliveryRequest';

  /// ✅ Get bids for ONE delivery request
  Future<List<BidModel>> getBids(String deliveryRequestDocId) {
    return _db
        .collection(collection)
        .doc(deliveryRequestDocId)
        .collection('bids')
        .orderBy('createdAt', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs
              .map((doc) => BidModel.fromFirestore(doc.data(), doc.id))
              .toList(),
        );
  }
}
