// lib/main.dart
import 'package:corses_dio/views/home_page.dart';
import 'package:corses_dio/views/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';

void main() {
  // Initialize CartController
  Get.put(CartController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: [
        GetPage(
            name: '/product-detail',
            page: () => ProductDetailPage(product: Get.arguments)),
      ],
      initialRoute: '/',
    );
  }
}
