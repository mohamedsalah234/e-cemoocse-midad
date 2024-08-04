// lib/controllers/midadd_controller.dart
import 'package:get/get.dart';
import '../models/midadd_model.dart';
import '../services/midadd_service.dart';

class MidaddController extends GetxController {
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
      var midaddData = await MidaddService().fetchMidadds();
      products.assignAll(midaddData.data ?? []);
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
