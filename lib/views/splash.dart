import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import './Product_page.dart';
import 'login_page.dart';

void main() => runApp(const spashcreen());

class spashcreen extends StatelessWidget {
  const spashcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.network(
                'https://lottie.host/cca9d115-b265-4e08-88e6-1351059f0a75/0P7bl3KKno.json'),
            SizedBox(
              height: 75,
            ),
            Center(
              child: Text(
                'أهلاً وسهلاً بك في مول البيت الذهبي ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'BoutrosNewsH1',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'نحن هنا لنلبي كل احتياجاتك ونوفر لك تجربة تسوق لا تُنسى. شكرًا لزيارتك ونتمنى لك وقتًا ممتعًا',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[700],
                  fontFamily: 'BoutrosNewsH1',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 50,
                width: 200, // Set your desired width here
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 124, 7, 192)),
                  ),
                  onPressed: () {
                    Get.to(() => Login());
                  },
                  child: LottieBuilder.network(
                      'https://lottie.host/54487e4d-269d-4fb2-958b-aaa3c51979e6/7d1tjBbtiq.json'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
