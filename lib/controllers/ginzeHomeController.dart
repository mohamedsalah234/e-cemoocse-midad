// controllers/home_controller.dart
import 'package:corses_dio/models/ganze_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GenzeHomeController extends GetxController {
  var banners = <BannerModel>[].obs;
  var products = <ProductModel>[].obs;
  var isLoading = true.obs; // تأكد من وجود هذا السطر

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  void fetchHomeData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://student.valuxapps.com/api/home'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];

        if (data != null) {
          var bannerList = data['banners'] as List;
          var productList = data['products'] as List;

          banners.value = bannerList.map((banner) => BannerModel.fromJson(banner)).toList();
          products.value = productList.map((product) => ProductModel.fromJson(product)).toList();
        }
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
