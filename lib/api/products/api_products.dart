import 'dart:convert';
import 'product_model.dart';
import 'package:http/http.dart' as http;

class APIProducts {
  static const String url = 'https://ttnhan-001-site1.htempurl.com/Home/getData?pageSize=100';
  APIProducts();

  static Future<List<Product>> parseProducts(String responseBody) async {
    Map<String, dynamic> responseMap = json.decode(responseBody);
    var productsJson = responseMap['products'] as List<dynamic>;
    List<Product> products = productsJson.map((model) => Product.fromJson(model)).toList();
    return products;
  }

  static Future<List<Product>> fetchProducts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      return await parseProducts(response.body);
    }
    else if (response.statusCode == 404) {
      throw Exception('Not Found');
    }
    else{
      throw Exception('Can\'t get post');
    }
  }
}