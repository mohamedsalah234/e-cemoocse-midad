// lib/pages/home_page.dart
import 'package:corses_dio/controllers/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/Product_page.dart';
import '../views/cart_page.dart';
import '../views/tsest.dart';
import 'midadpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: Color.fromARGB(255, 189, 175, 212),
            backgroundColor: Color.fromARGB(255, 154, 196, 17),
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 44, 9, 127),
                icon: Icon(Icons.shop),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(45, 104, 134, 1.0),
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(19, 44, 57, 1.0),
                icon: Icon(Icons.list),
                label: 'Test',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits),
                label: 'cartPage',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
          )),
    );
  }
}
