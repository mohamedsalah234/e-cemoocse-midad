// lib/models.dart

class BannerModel {
  final String imageUrl;

  BannerModel({required this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      imageUrl: json['image'] ?? '', // تعامل مع null
    );
  }
}

class ProductModel {
  final String image;
  final String name;
  final double price;
  final double oldPrice;
  final int discount;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] ?? '',
      name: json['name'] ?? 'No Name',
      price: json['price']?.toDouble() ?? 0.0,
      oldPrice: json['old_price']?.toDouble() ?? 0.0,
      discount: json['discount'] ?? 0,
    );
  }
}
