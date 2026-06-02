import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiProvider {
  //===========================_baseurl===========================================
  static const String _baseUrl = 'https://fakestoreapi.com';
  //================================all prodocuded===========================================

  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('$_baseUrl/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: status code ${response.statusCode}');
    }
  }

//==========================category==================================================
  Future<List<Product>> fetchProductsByCategory(String category) async {
    final url = Uri.parse('$_baseUrl/products/category/$category');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products for category $category: status code ${response.statusCode}');
    }
  }


  //======================list of categories================================
  Future<List<String>> fetchCategories() async {
    final url = Uri.parse('$_baseUrl/products/categories');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => e.toString()).toList();
    } else {
      throw Exception('Failed to load categories: status code ${response.statusCode}');
    }
  }
}
