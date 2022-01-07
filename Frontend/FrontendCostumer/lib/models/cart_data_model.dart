class CartData {
  final int productId;
  final String photo;
  final String name;
  final double price;

  const CartData(this.productId, this.photo, this.name, this.price);
  
  factory CartData.fromMap(Map<String, dynamic> json) {
    return CartData(
      json['productid'],
      json['photo'],
      json['name'],
      json['price'].toDouble(),
    );
  }
}