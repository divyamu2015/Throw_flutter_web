class Customer {
  final String id;          // Firestore document ID
  final String name;        // displayName
  final String email;
  final String phone;
  final String userType;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.userType,
  });

  /// Create object FROM Firestore
  factory Customer.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return Customer(
      id: documentId,
      name: data['displayName'] ?? '',
      email: data['email'] ?? '',
      phone: data['phoneNumber'] ?? '',
      userType: data['userType'] ?? 'user',
    );
  }

  /// Convert object TO Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'displayName': name,
      'email': email,
      'phoneNumber': phone,
      'userType': userType,
    };
  }
}
