import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/models/delivery_request_list.dart';

class DeliveryRequestService {
  final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String collection = 'deliveryRequest';

  /// TOTAL
  Stream<int> getTotalDeliveriesCount() {
    return _db.collection(collection).snapshots().map((s) => s.docs.length);
  }

  /// ON THE WAY
  Stream<int> getActiveDeliveriesCount() {
    return _db
        .collection(collection)
        .where('deliveryStatus', isEqualTo: 'On The Way')
        .snapshots()
        .map((s) => s.docs.length);
  }

  Stream<int> getDropOffDeliveriesCount() {
    return _db
        .collection(collection)
        .where('deliveryStatus', isEqualTo: 'Drop Off')
        .snapshots()
        .map((s) => s.docs.length);
  }

  Stream<int> getPendingDeliveriesCount() {
    return _db
        .collection(collection)
        .where('deliveryStatus', isEqualTo: 'Pending')
        .snapshots()
        .map((s) => s.docs.length);
  }

  Stream<List<DeliveryRequest>> getDeliveryRequests() {
    return _db
        .collection(collection)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => DeliveryRequest.fromFirestore(doc.data(), doc.id))
              .where((req) => req.deliveryRequestId.trim().isNotEmpty)
              .toList(),
        );
  }
}
