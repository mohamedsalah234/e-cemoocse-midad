import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/test_controller.dart';

class testpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testController controller = Get.put(testController());

    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Store Home',
          style: TextStyle(
              color: Color.fromARGB(255, 6, 84, 139),
              fontWeight: FontWeight.bold),
        ),
      )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              cursorColor: Colors.amberAccent,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onChanged: (value) => controller.updateSearchKeyword(value),
            ),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 15, 83, 129)),
                    borderRadius: BorderRadius.circular(15)),
                child: CarouselSlider(
                  options: CarouselOptions(
                    pageSnapping: true,
                    height: 190.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: controller.products.isNotEmpty
                      ? controller.products.map((product) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.network(product['thumbnail'],
                                    fit: BoxFit.cover),
                              );
                            },
                          );
                        }).toList()
                      : [Center(child: CircularProgressIndicator())],
                ),
              ),
            );
          }),
          Expanded(
            child: Obx(() {
              return controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];
                        return Card(
                          color: const Color.fromARGB(255, 45, 104, 134),
                          shadowColor: const Color.fromARGB(31, 193, 21, 21),
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              product['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              product['description'],
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: Image.network(
                              product['thumbnail'],
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                            trailing: Text(
                              '\$${product['price']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}
