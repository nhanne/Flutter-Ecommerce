import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clothes/api/stocks/stock_model.dart';

class APIStocks {
  static const String url = 'https://ttnhan-001-site1.htempurl.com/Home/Product?Id=';
  APIStocks();

  static Future<Stock> parseStock(String responseBody) async {
    Map<String, dynamic> responseMap = json.decode(responseBody);
    Stock stock = Stock.fromJson(responseMap);
    return stock;
  }

  static Future<Stock> fetchStockByProductId(String productId) async {
    final response = await http.get(Uri.parse(url + productId));
    if (response.statusCode == 200){
      return await parseStock(response.body);
    }
    else if (response.statusCode == 404) {
      throw Exception('Not Found');
    }
    else{
      throw Exception('Can\'t get post');
    }
  }

}