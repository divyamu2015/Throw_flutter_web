import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:throw_app/core/models/customer_list.dart';



class CustomerService {
   final FirebaseFirestore _db = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );
  static const String userCollection = 'users';
  Stream<List<Customer>> getCustomers() {
    return _db
        .collection(userCollection)
        .where('userType', isEqualTo: 'user')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Customer.fromFirestore(doc.data(), doc.id))
            .toList());
  }
}

