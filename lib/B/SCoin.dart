class Coin {
 String id;
   String image;
  String price;
 double quantity; // Quantity of the bought coins

  Coin({required this.id, required this.image, required this.price, required this.quantity});

  // Getter for id
  String get coinId => id;

  // Getter for image
  String get coinImage => image;

  // Getter for price
  String get coinPrice => price;

  // Getter for quantity
  double get coinQuantity => quantity;


 factory Coin.fromJson(Map<String, dynamic> json) {
  return Coin(
   id: json['id'] ?? '',
   image: json['image'] ?? '',
   price: json['price'] ?? '',
   quantity: json['quantity'] ?? 0.0,
  );
 }
}
List<Coin>? boughtCoins;