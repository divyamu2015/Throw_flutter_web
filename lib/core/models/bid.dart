// ignore_for_file: public_member_api_docs, sort_constructors_first

class Bid {
  final String name;
  final double rating;
  final String eta;
  final double price;
  final String imageUrl;
  final double? bargainedPrice;
  final bool agentLeftAuction;
  const Bid({
    required this.name,
    required this.rating,
    required this.eta,
    required this.price,
    required this.imageUrl,
    this.bargainedPrice,
    this.agentLeftAuction = false,
  });

  // Create a copyWith method for immutable updates
  Bid copyWith({
    String? name,
    double? rating,
    String? eta,
    double? price,
    String? imageUrl,
    double? bargainedPrice,
    bool? agentLeftAuction,
  }) {
    return Bid(
      name: name ?? this.name,
      rating: rating ?? this.rating,
      eta: eta ?? this.eta,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      bargainedPrice: bargainedPrice ?? this.bargainedPrice,
      agentLeftAuction: agentLeftAuction ?? this.agentLeftAuction,
    );
  }
}
