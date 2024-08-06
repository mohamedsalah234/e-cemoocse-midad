import 'package:corses_dio/models/newsha_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewshaController extends GetxController {
  var newshas = <Newsha>[].obs;

  get isLoading => null;

  get errorMessage => null;

  get filteredProducts => null;

  @override
  void onInit() {
    fetchNewshas();
    super.onInit();
  }

  void fetchNewshas() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      newshas.value = (data['products'] as List)
          .map((newsha) => Newsha.fromJson(newsha))
          .toList();
    } else {
      // Handle errors here
      throw Exception('Failed to load newshas');
    }
  }

  updateSearchQuery(String value) {}
}
