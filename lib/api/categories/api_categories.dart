import 'dart:convert';
import 'package:http/http.dart' as http;
import 'category_model.dart';

class APICategories {
  static const String url = 'https://ttnhan-001-site1.htempurl.com/Home/getCategories';

  APICategories();

  static List<Category> parseCategories(String responseBody){
    Map<String, dynamic> responseMap = json.decode(responseBody);
    var categoriesJson = responseMap['categories'] as List<dynamic>;
    List<Category> categories = categoriesJson.map((model) => Category.fromJson(model)).toList();
    return categories;
  }

  static Future<List<Category>> fetchCategories({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      return parseCategories(response.body);
    }
    else if (response.statusCode == 404) {
      throw Exception('Not Found');
    }
    else{
      throw Exception('Can\'t get post');
    }
  }
}