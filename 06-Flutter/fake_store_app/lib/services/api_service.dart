import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiService {
  final String _baseUrl = 'https://fakestoreapi.com';
  final String _simpleServerUrl = 'http://localhost:3001';

  // 안드로이드 애뮬레이터 실행을 위한 url
  final String _androidServerUrl = 'http://10.0.2.2:3001';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw 'Failed to load products';
    }
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw 'Failed to load product';
    }
  }

  Future<String> createPaymentIntent() async {
    final response = await http.post(
      Uri.parse(
        Platform.isAndroid
            ? '$_androidServerUrl/create-payment-intent'
            : '$_simpleServerUrl/create-payment-intent',
      ),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['clientSecret'];
    } else {
      throw 'Failed to create checkout session';
    }
  }
}
