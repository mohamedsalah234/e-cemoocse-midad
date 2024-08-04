// lib/services/midadd_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/midadd_model.dart';

class MidaddService {
  final String baseUrl = 'https://student.valuxapps.com/api/products';

  Future<MidaddData> fetchMidadds() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return MidaddResponse.fromJson(jsonResponse).data!;
    } else {
      throw Exception('Failed to load midadds');
    }
  }
}
