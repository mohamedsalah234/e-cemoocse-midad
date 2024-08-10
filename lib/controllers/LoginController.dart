import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../views/home_page.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login() async {
    isLoading.value = true;
    errorMessage.value = '';

    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': email.value,
        'password': password.value,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Handle successful login, e.g., save token and navigate to another page
      print('Login successful: ${data['token']}');
      Get.to(() => HomePage()); // Navigate to ProductPage on successful login
    } else {
      // Handle error
      final data = jsonDecode(response.body);
      errorMessage.value = data['message'];
    }
  }
}
