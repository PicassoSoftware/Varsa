class ProductDetail {
  final int id;
  final double price;
  final String productName;
  final String branchName;
  final String details;
  final String photo;
  final int daysForExpiration;

  const ProductDetail(this.id, this.price, this.productName, this.branchName, this.details, this.photo,
      this.daysForExpiration);
  factory ProductDetail.fromMap(Map<String, dynamic> json) {
    return ProductDetail(
      json['id'],
      json['price'].toDouble(),
      json['productname'],
      json['branchname'],
      json['detailedinfo'],
      json['photo'],
      json['expirationdate'],
    );
  }
}
