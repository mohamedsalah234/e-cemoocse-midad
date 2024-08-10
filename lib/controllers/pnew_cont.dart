import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Pnewapi.dart';

class nooProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Product> productList = (data['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();

        // ترتيب المنتجات من الأكبر إلى الأصغر بناءً على id
        productList.sort((a, b) => b.id.compareTo(a.id));

        products.assignAll(productList);
      } else {
        errorMessage.value =
            'Failed to load products with status code: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);
    }
  }
}
