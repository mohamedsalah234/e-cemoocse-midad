// lib/main.dart
import 'package:corses_dio/controllers/newsha_controller.dart';
import 'package:corses_dio/controllers/pnew_cont.dart';
import 'package:corses_dio/views/Product_page.dart';
import 'package:corses_dio/views/midadpage.dart';
import 'package:corses_dio/views/newProductListPage.dart';
import 'package:corses_dio/views/newsha_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';
import 'models/product.dart';
import 'views/home_page.dart';
import 'views/product_detail_page.dart';
import './views/splash.dart';
import './views/cardhome.dart';

void main() {
  Get.put(ProductController());
  // Initialize CartController
  Get.put(CartController());
  Get.put(NewshaController());
  Get.put(nooProductController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get product => null;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // تأكد من كتابة اسم الصفحة بشكل صحيح
      getPages: [
        GetPage(name: '/HomePage', page: () => HomePage()),
        GetPage(
            name: '/FullWidthCardWithImage',
            page: () => FullWidthCardWithImage()),
        GetPage(name: '/NewshaPage', page: () => NewshaPage()),
        GetPage(name: '/spash', page: () => SplashScreen()),
        GetPage(
          name: '/product',
          page: () => ProductPage(), // تأكد من تمرير المنتج من `Get.arguments`
        ),
        GetPage(name: '/apiPage', page: () => MidadPage()),
        GetPage(
            name: '/FullWidthCardWithImage',
            page: () => FullWidthCardWithImage()),
        GetPage(
            name: '/product-detail',
            page: () => ProductDetailPage(product: Get.arguments)),
        GetPage(name: '/products2', page: () => NewProductListPage()),
        GetPage(
            name: '/product/:id',
            page: () => ProductDetailPage(product: Get.arguments)),
      ],
      initialRoute: '/spash',
    );
  }
}
