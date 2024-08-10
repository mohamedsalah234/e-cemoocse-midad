import 'package:corses_dio/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pnew_cont.dart';
import 'pnewapidiles.dart';

class NewProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nooProductController controller = Get.find<nooProductController>();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(color: Colors.white, Icons.shopping_bag_outlined, size: 28),
            SizedBox(width: 8),
            Text(
              'SuperShop',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0, // حجم الخط الكبير لجذب الانتباه
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic, // خط مائل لجاذبية أكبر
              ),
            ),
          ],
        ),
        centerTitle: true, // توسيط العنوان
        backgroundColor:
            const Color.fromARGB(151, 104, 9, 96), // لون خلفية جذاب
        elevation: 10.0, // إضافة ظل أسفل الـ AppBar
        shadowColor: Colors.purpleAccent, // لون ظل الـ AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // حدث لزر المفضلة
            },
          ),
        ],
        automaticallyImplyLeading: false, // إلغاء زر الرجوع الافتراضي
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد العناصر في كل صف
                crossAxisSpacing: 8.0, // المسافة الأفقية بين العناصر
                mainAxisSpacing: 8.0, // المسافة الرأسية بين العناصر
                childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع لكل عنصر
              ),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ssProductDetailPage(product: product));
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
                                  product.thumbnail,
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
                                    product.title.length > 11
                                        ? '${product.title.substring(0, 11)}...'
                                        : product.title,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    '\$${product.price.toString()}',
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
          Navigator.pop(context); // الرجوع إلى الشاشة السابقة
        },
        child: Icon(color: Colors.white, Icons.arrow_back),
        backgroundColor: const Color.fromARGB(255, 113, 5, 133),
        tooltip: 'Back',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
