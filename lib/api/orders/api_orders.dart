import 'dart:convert';
import 'package:clothes/api/orders/order_model.dart';
import 'package:http/http.dart' as http;

class APIOrders {

  static const String url = 'https://ttnhan-001-site1.htempurl.com/Flutter/GetListOrdersById?id=';

  APIOrders();

  static List<OrderModel> parseOrders(String responseBody){
    List<dynamic> responseMap = json.decode(responseBody);
    List<OrderModel> orders = responseMap.map((model) => OrderModel.fromJson(model)).toList();
    return orders;
  }

  static Future<List<OrderModel>> fetchOrders(String id) async {
    final response = await http.get(Uri.parse(url+id));
    if (response.statusCode == 200){
      return parseOrders(response.body);
    }
    else if (response.statusCode == 404) {
      throw Exception('Not Found');
    }
    else{
      throw Exception('Can\'t get post');
    }
  }
}