// lib/controllers/product_controller.dart
import 'package:get/get.dart';
import '../models/product.dart';
import '../services/product_servic.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var searchQuery = ''.obs; // نص البحث

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var productList = await ProductService().fetchProducts();
      products.assignAll(productList);
      filteredProducts.assignAll(productList); // تعيين المنتجات المفلترة
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void updateSearchQuery(String query) {
    searchQuery(query);
    filteredProducts.assignAll(products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
