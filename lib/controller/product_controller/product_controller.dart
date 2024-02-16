import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda/api/api_key.dart';
import 'package:tezda/model/product_model/product_model.dart';

class ProductController {
  final client = http.Client();

  Future<ProductModel?> getAllProducts() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final token = pref.get('token');
    print(token);

    try {
      final response = await client
          .get(Uri.parse("${API().baseUrl}${API().allProducts}"), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final ProductModel product = ProductModel.fromJson(responseBody);
        return product;
      }
    } catch (er) {
      print(er);
    }
    return null;
  }
}
