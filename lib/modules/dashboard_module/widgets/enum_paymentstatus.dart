enum PaymentStatus {
  pending('Pending'),
  escrowAmountPaid('Escrow Amount Paid'),//user paid to wallet
  escrowAmountReleased('Escrow Amount Released');//wallet paid to delivery agent

  final String value;
  const PaymentStatus(this.value);

  factory PaymentStatus.fromString(String name) {
    return PaymentStatus.values.firstWhere((e) => e.value == name);
  }

  String toJson() => value;
} 
