class Product {
  final int id;
  final int stock;
  final double price;
  final String name;
  final String photo;
  final int daysForExpiration;

  const Product(this.id, this.stock, this.price, this.name, this.photo,
      this.daysForExpiration);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['stock'],
      json['price'].toDouble(),
      json['name'],
      json['photo'],
      json['days_for_expiration'],
    );
  }
}
