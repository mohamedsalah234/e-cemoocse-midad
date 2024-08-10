import 'package:corses_dio/controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
          child: Obx(() {
            return ListView(
              children: [
                const Center(
                    child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 128, 0, 119),
                        ),
                      ],
                      color: Color.fromARGB(255, 107, 1, 100),
                      fontFamily: 'BoutrosNewsH1',
                      fontSize: 33,
                      fontWeight: FontWeight.w900),
                )),
                Lottie.asset(
                  'assets/animation/login.json',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 150),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        onChanged: (value) {
                          loginController.email.value = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'البريد الالكتروني',
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.grey[300]!, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 117, 2, 123),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.grey[300]!, width: 1.5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) {
                          loginController.password.value = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور',
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.grey[300]!, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 86, 0, 86),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.grey[300]!, width: 1.5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 126, 1, 142)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          loginController.login();
                        },
                        child: Obx(() {
                          if (loginController.isLoading.value) {
                            return CircularProgressIndicator(
                              color: Colors.white,
                            );
                          } else {
                            return Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  fontFamily: 'ReemKufiFun',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        })),
                  ),
                ),
                if (loginController.errorMessage.value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      loginController.errorMessage.value,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ), 
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
