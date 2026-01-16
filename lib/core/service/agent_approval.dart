import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/models/agent_approval.dart';

class DeliveryAgentService {
  final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String agentCollection = 'deliveryAgents';

  /// 🔹 Get ALL delivery agents
  Stream<List<DeliveryAgent>> getAllAgents() {
    return _db
        .collection(agentCollection)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                DeliveryAgent.fromFirestore(doc.data(), doc.id))
            .toList());
  }
Future<void> approveAgent(String uid) async {
    await _db.collection(agentCollection).doc(uid).update({
      'hasApproved': true,
      'status': 'approved',
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> rejectAgent(String uid) async {
    await _db.collection(agentCollection).doc(uid).update({
      'hasApproved': false,
      'status': 'rejected',
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
  /// 🔹 Get agents by status (approved / pending / suspended)
  // Stream<List<DeliveryAgent>> getAgentsByStatus(String status) {
  //   return _db
  //       .collection(agentCollection)
  //       .where('status', isEqualTo: status)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) =>
  //               DeliveryAgent.fromFirestore(doc.data(), doc.id))
  //           .toList());
  // }

  /// 🔹 Get only pending approval agents
  // Stream<List<DeliveryAgent>> getPendingAgents() {
  //   return _db
  //       .collection(agentCollection)
  //       .where('hasApproved', isEqualTo: false)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) =>
  //               DeliveryAgent.fromFirestore(doc.data(), doc.id))
  //           .toList());
  // }

  /// 🔹 Approve agent
  // Future<void> approveAgent(String agentId) async {
  //   await _db.collection(agentCollection).doc(agentId).update({
  //     'hasApproved': true,
  //     'status': 'approved',
  //     'updatedAt': FieldValue.serverTimestamp(),
  //   });
  // }

  /// 🔹 Reject / suspend agent
  // Future<void> suspendAgent(String agentId) async {
  //   await _db.collection(agentCollection).doc(agentId).update({
  //     'status': 'suspended',
  //     'updatedAt': FieldValue.serverTimestamp(),
  //   });
  // }
}
 