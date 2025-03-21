import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:platzi_store/Platzi%20Store/model/Api_Categories/Product_Lists.dart';

class Products {
  static Future<List<ProductLists>> getProducts() async {
    try {
      // Send GET request to the API
      final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/products'),
      );

      // Validate response status code
      if (response.statusCode != 200) {
        throw Exception('HTTP Error: ${response.statusCode}');
      }

      // Decode JSON response
      final List<dynamic> jsonData = json.decode(response.body);
      print('Raw JSON: ${response.body}'); // Debugging: Print raw JSON

      // Map JSON data to ProductLists objects
      return jsonData.map((list) => ProductLists.fromJson(list)).toList();
    } catch (e) {
      print('Error: $e'); // Log the actual exception
      throw Exception('Failed to load products');
    }
  }
}
