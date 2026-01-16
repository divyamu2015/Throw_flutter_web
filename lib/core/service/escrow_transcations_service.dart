import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/models/delivery_request_list.dart';
import 'package:throw_app/modules/dashboard_module/widgets/enum_paymentstatus.dart';

class EscrowTransactionsService {
  final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String collection = 'deliveryRequest';

  /// 🔹 All requests
  Stream<List<DeliveryRequest>> getDeliveryRequests() {
    return _db.collection(collection).snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) =>
                  DeliveryRequest.fromFirestore(doc.data(), doc.id))
              .where((req) => req.deliveryRequestId.trim().isNotEmpty)
              .toList(),
        );
  }

  /// ✅ ONLY Escrow Paid Requests
  Stream<List<DeliveryRequest>> getEscrowPaidRequests() {
    return _db
        .collection(collection)
       .where(
  'paymentStatus',
  whereIn: [
    PaymentStatus.escrowAmountPaid.value,
    PaymentStatus.escrowAmountReleased.value,
  ],
)

        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) =>
                  DeliveryRequest.fromFirestore(doc.data(), doc.id))
              .toList(),
        );
  }
}
