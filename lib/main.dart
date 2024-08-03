// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'views/home_page.dart';
import 'views/product_detail_page.dart';
import './views/tsest.dart'; // تأكد من أن الملف والصفحة بنفس الاسم

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
      home: HomePage(), // تأكد من كتابة اسم الصفحة بشكل صحيح
      getPages: [
        GetPage(name: '/test', page: () => testpage()),
        GetPage(
            name: '/product-detail',
            page: () => ProductDetailPage(product: Get.arguments)),
      ],
      initialRoute: '/test',
    );
  }
}
