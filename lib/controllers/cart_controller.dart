import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartData();
  }

  Future<void> addToCart(CartItem item) async {
    cartItems.add(item);
    await saveCartData();
  }

  Future<void> removeFromCart(int id) async {
    cartItems.removeWhere((item) => item.id == id);
    await saveCartData();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    await saveCartData();
  }

  Future<void> saveCartData() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = cartItems.map((item) => item.toJson()).toList();
    await prefs.setString('cartItems', jsonEncode(cartData));
  }

  Future<void> loadCartData() async {
    final prefs = await SharedPreferences.getInstance();
    final cartDataString = prefs.getString('cartItems');
    if (cartDataString != null) {
      final List<dynamic> cartDataJson = jsonDecode(cartDataString);
      final List<CartItem> loadedCartItems = cartDataJson
          .map(
              (itemJson) => CartItem.fromJson(itemJson as Map<String, dynamic>))
          .toList();
      cartItems.assignAll(loadedCartItems);
    }
  }

  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) => sum + item.price);
  }
}
