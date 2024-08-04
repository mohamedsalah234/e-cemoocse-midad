// lib/main.dart
import 'package:corses_dio/views/Product_page.dart';
import 'package:corses_dio/views/midadpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'views/home_page.dart';
import 'views/product_detail_page.dart';
import './views/tsest.dart';

void main() {
  // Initialize CartController
  Get.put(CartController());
  // Get.put(HomeController());

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
      home: HomePage(), // تأكد من كتابة اسم الصفحة بشكل صحيح
      getPages: [
        GetPage(name: '/product', page: () => ProductPage()),
        GetPage(name: '/apiPage', page: () => MidadPage()),
        GetPage(name: '/test', page: () => testpage()),
        GetPage(
            name: '/product-detail',
            page: () => ProductDetailPage(product: Get.arguments)),
      ],
      initialRoute: '/apiPage',
    );
  }
}
