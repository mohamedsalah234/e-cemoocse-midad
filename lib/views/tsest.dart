import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/test_controller.dart';
import 'splash.dart';

class testpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testController controller = Get.put(testController());

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(color: Colors.white, Icons.shopping_bag_outlined, size: 28),
            SizedBox(width: 8),
            Text(
              'Store Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(151, 104, 9, 96),
        elevation: 10.0,
        shadowColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // حدث لزر المفضلة
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.products.isEmpty) {
          return Center(child: Text("No products available."));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return GestureDetector(
                  onTap: () {
                    // فتح صفحة تفاصيل المنتج
                    Get.to(() => SplashScreen()); // أو صفحة أخرى حسب الحاجة
                  },
                  child: Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.0)),
                                child: Image.network(
                                  product['thumbnail'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['title'].length > 11
                                        ? '${product['title'].substring(0, 11)}...'
                                        : product['title'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    '\$${product['price']}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: IconButton(
                            icon:
                                Icon(Icons.favorite_border, color: Colors.red),
                            onPressed: () {
                              // إضافة المنتج إلى المفضلة
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 8.0,
                          right: 8.0,
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: const Color.fromARGB(255, 132, 4, 104)),
                            onPressed: () {
                              // إضافة المنتج إلى السلة
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(color: Colors.white, Icons.arrow_back),
        backgroundColor: const Color.fromARGB(255, 113, 5, 133),
        tooltip: 'Back',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
