import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final List<String> imgList; // قائمة الصور
  final double height; // ارتفاع السلايدر
  final double viewportFraction; // نسبة عرض العنصر الواحد

  CustomSlider({
    required this.imgList,
    this.height = 300.0, // قيمة افتراضية لارتفاع السلايدر
    this.viewportFraction = 0.7, // قيمة افتراضية لنسبة العرض
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        clipBehavior: Clip.antiAlias,
        animateToClosest: true,
        height: height, // تعيين الارتفاع
        autoPlay: true, // التشغيل التلقائي
        enlargeCenterPage: true, // تكبير العنصر المركزي
        aspectRatio: 16 / 9, // نسبة العرض إلى الارتفاع
        viewportFraction: viewportFraction, // تعيين نسبة العرض
      ),
      items: imgList.map((item) {
        return Container(
          width: 500, // تعيين عرض الحاوية
          height: 100, // تعيين ارتفاع الحاوية
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 6, 115, 146), // لون الحافة
              width: 3.0, // سمك الحافة
            ),
            borderRadius: BorderRadius.circular(20), // حواف دائرية
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 5, 84, 129)
                    .withOpacity(0.3), // لون الظل مع الشفافية
                spreadRadius: 3.0, // مدى امتداد الظل
                blurRadius: 2.0, // قوة تلطيف الظل
                offset: Offset(0, 3), // إزاحة الظل
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                10), // تأكد من أن الصورة تتبع الحواف الدائرية
            child: Image.asset(
              item,
              fit: BoxFit.fill, // ضبط الصورة لتغطية الحاوية بشكل مناسب
              width: 500, // تأكيد عرض الصورة
              height: 100, // تأكيد ارتفاع الصورة
            ),
          ),
        );
      }).toList(),
    );
  }
}
