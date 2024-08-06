import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corses_dio/controllers/newsha_controller.dart';

class NewshaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewshaController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Newsha Products',
            style:
                TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search products...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) => controller.updateSearchQuery(value),
              ),
            ),
            Container(
              color: Color.fromARGB(
                  255, 255, 255, 255), // إضافة لون الخلفية البنفسجي هنا
              padding: EdgeInsets.all(16.0),
              child: Obx(() {
                if (controller.newshas.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio:
                          0.7, // ضبط النسبة لجعل الكارد أطول عموديًا
                    ),
                    itemCount: controller.newshas.length,
                    itemBuilder: (context, index) {
                      final newsha = controller.newshas[index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2, // زيادة المرونة لتعطي مساحة أكبر للصورة
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10.0)),
                                child: Image.network(
                                  newsha.image,
                                  width: double.infinity,
                                  height:
                                      180, // يمكنك ضبط هذا لتحديد ارتفاع الصورة
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1, // تقليل المرونة لتعطي مساحة أقل للنص
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newsha.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '\$${newsha.price}',
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
