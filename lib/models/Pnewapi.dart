import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 'no dawnlod',
      title: json['title'] ?? 'no dawnlod',
      description: json['description'] ?? 'no dawnlod',
      category: json['category'] ?? 'no dawnlod',
      price: json['price'].toDouble() ?? 'no dawnlod',
      discountPercentage: json['discountPercentage'].toDouble() ?? 'no dawnlod',
      rating: json['rating'].toDouble() ?? 'no dawnlod',
      stock: json['stock'] ?? 'no dawnlod',
      tags: List<String>.from(json['tags'] ?? 'no dawnlod'),
      brand: json['brand'] ?? 'no dawnlod',
      sku: json['sku'] ?? 'no dawnlod',
      weight: json['weight'].toDouble() ?? 'no dawnlod',
      dimensions: Dimensions.fromJson(json['dimensions'] ?? 'no dawnlod'),
      warrantyInformation: json['warrantyInformation'] ?? 'no dawnlod',
      shippingInformation: json['shippingInformation'] ?? 'no dawnlod',
      availabilityStatus: json['availabilityStatus'] ?? 'no dawnlod',
      reviews: (json['reviews'] as List)
          .map((review) => Review.fromJson(review))
          .toList(),
      returnPolicy: json['returnPolicy'] ?? 'no dawnlod',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 'no dawnlod',
      meta: Meta.fromJson(json['meta'] ?? 'no dawnlod'),
      images: List<String>.from(json['images'] ?? 'no dawnlod'),
      thumbnail: json['thumbnail'] ?? 'no dawnlod',
    );
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
