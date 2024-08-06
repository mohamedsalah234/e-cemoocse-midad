// lib/models/product.dart
final String pathphoto =
    'https://img.freepik.com/free-vector/black-tea-bag-vector-realistic-product-placement-mock-up-3d-detailed-illustration-tea-leaves-infusions_1268-18070.jpg?t=st=1722628986~exp=1722632586~hmac=491887fe8a90d05142a25e980950a57b58b5016d1f3cb3363445dc4fa590ef80&w=740';
// استخدام صورة افتراضية عبر الإنترنت إذا كانت الصورة غير موجودة

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No Description',
      price: (json['price'] ?? 0.0).toDouble(),
      image: json['image'] ??
          '$pathphoto', // استخدام صورة افتراضية عبر الإنترنت إذا كانت الصورة غير موجودة
    );
  }

  get discount => null;
}
