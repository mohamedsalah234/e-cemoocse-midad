import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import './Product_page.dart';
import 'login_page.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    // Add a delay before showing the button
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from the network
            Lottie.asset('assets/animation/splash.json'),
            const SizedBox(height: 75),
            const Center(
              child: Text(
                'أهلاً وسهلاً بك في مول البيت الذهبي',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'BoutrosNewsH1',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 100),
            Center(
              child: _showButton
                  ? Container(
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
                        child: Lottie.asset('assets/animation/next.json'),
                      ),
                    )
                  : Container(), // Empty container while button is hidden
            ),
          ],
        ),
      ),
    );
  }
}
