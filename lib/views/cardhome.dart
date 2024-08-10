import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:corses_dio/views/newProductListPage.dart';
import 'package:corses_dio/views/pnewapidiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corses_dio/views/home_page.dart';
import 'package:corses_dio/views/midadpage.dart';
import 'package:corses_dio/views/ganze_page.dart';
import 'package:corses_dio/views/tsest.dart';

class FullWidthCardWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/imgs/sall2.jfif',
      'assets/imgs/sall5.png',
      'assets/imgs/sall1.jfif',
      'assets/imgs/sall3.jfif',
      'assets/imgs/sall6.jfif',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover & Explore',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 4,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider
            CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) {
                final imgUrl = imgList[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 220,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.easeInOut,
              ),
            ),
            SizedBox(height: 20),

            // Section Title
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.4),
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Text(
                  'Shop by Categories',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(0, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Category Buttons
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: 3,
                itemBuilder: (context, index) {
                  final categories = [
                    {
                      'image': 'assets/imgs/acses.jpg',
                      'title': 'Accessories',
                      'page': testpage(),
                    },
                    {
                      'image': 'assets/imgs/mopaile.jpg',
                      'title': 'Smart Devices',
                      'page': MidadPage(),
                    },
                    // {
                    //   'image': 'assets/imgs/mopaile.jpg',
                    //   'title': 'Women\'s Accessories',
                    //   'page': GnzeHomeScreen(),
                    // },
                    {
                      'image': 'assets/imgs/kodar.jfif',
                      'title': 'Vegetables',
                      'page': NewProductListPage(),
                    },
                  ];

                  final category = categories[index];
                  return _buildCategoryButton(
                    context,
                    imageUrl: category['image'] as String,
                    title: category['title'] as String,
                    onTap: () => Get.to(() => category['page'] as Widget),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context, {
    required String imageUrl,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
