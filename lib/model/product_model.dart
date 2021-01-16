class Product {
  const Product({
    this.id,
    this.name,
    this.mobile,
    this.modelNumber,
    this.purchaseDate,
    this.email,
  });

  final String id;
  final String name;
  final String mobile;
  final String modelNumber;
  final String purchaseDate;
  final String email;

  factory Product.fromGsheets(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      mobile: json['mobile'],
      modelNumber: json['modelNumber'] ?? '',
      purchaseDate: json['purchaseDate'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toGsheets() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'modelNumber': modelNumber,
      'purchaseDate': purchaseDate,
      'email': email,
    };
  }

  @override
  String toString() =>
      'Product{id: $id, name: $name, mobile: $mobile, modelNumber: $modelNumber  email: $email}';
}
