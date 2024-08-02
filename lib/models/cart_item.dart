// lib/models/cart_item.dart
import 'package:flutter/foundation.dart';

class CartItem {
  final int id;
  final String name;
  final String image;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
