import 'package:corses_dio/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/cart_controller.dart';
import '../models/Pnewapi.dart';

class ssProductDetailPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final Product product;

  ssProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج داخل Card مع تأثير ظل وإرتفاع
            Hero(
              tag: 'product-image-${product.id}', // Tag for Hero animation
              child: Material(
                elevation: 10,
                shadowColor: Colors.deepPurpleAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    product.images.isNotEmpty ? product.images[0] : '',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // الاسم والسعر على نفس السطر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // اسم المنتج
                Expanded(
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                // سعر المنتج
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 193, 71, 23),
                        const Color.fromARGB(255, 103, 58, 183)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrangeAccent.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.attach_money, color: Colors.white, size: 24),
                      SizedBox(width: 8),
                      Text(
                        '${product.price.toString()}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            // تقييم المنتج
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 24),
                  SizedBox(width: 8),
                  Text(
                    '${product.rating.toString()}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.thumb_up,
                            color: Colors.deepPurple, size: 18),
                        SizedBox(width: 4),
                        Text(
                          'Top Rated',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // وصف المنتج داخل Container مع خلفية وتصميم عصري
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.grey[800],
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(height: 20),

            // فئة المنتج
            Row(
              children: [
                Icon(Icons.category, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  'Category: ${product.category}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // معلومات الضمان
            if (product.warrantyInformation.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.verified_user, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text(
                    'Warranty: ${product.warrantyInformation}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ElevatedButton.icon(
            onPressed: () {
              cartController.addToCart(
                CartItem(
                  id: product.id,
                  name: product.title,
                  image: product.images.isNotEmpty ? product.images[0] : '',
                  price: product.price,
                ),
              );
              Get.snackbar('Added to Cart',
                  '${product..title} has been added to the cart');
              // وظيفة الزر
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white, size: 28),
            label: Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              shadowColor: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ),
    );
  }
}
