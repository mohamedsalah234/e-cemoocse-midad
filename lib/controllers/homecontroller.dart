// lib/controllers/home_controller.dart
import 'package:corses_dio/controllers/product_controller.dart';
import 'package:corses_dio/models/cartmodel.dart';
import 'package:corses_dio/views/Product_page.dart';
import 'package:corses_dio/views/midadpage.dart';
import 'package:corses_dio/views/tsest.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../views/cart_page.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    ProductPage(),
    CartPage(),
    testpage(),
    MidadPage(),
  ];
}
