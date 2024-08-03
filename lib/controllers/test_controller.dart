import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class testController extends GetxController {
  var products = [].obs;
  var isLoading = false.obs;
  var searchKeyword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts([String keyword = '']) async {
    isLoading(true);
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/search?q=$keyword'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products.value = data['products'];
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void updateSearchKeyword(String keyword) {
    searchKeyword.value = keyword;
    fetchProducts(keyword);
  }
}
