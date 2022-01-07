class RezervData {
  final int productId;
  final String photo;
  final int lastdate;
  final String code;

  const RezervData(this.productId, this.photo, this.lastdate, this.code);
  
  factory RezervData.fromMap(Map<String, dynamic> json) {
    return RezervData(
      json['productid'],
      json['photo'],
      json['lastdate'],
      json['code'],
    );
  }
}
