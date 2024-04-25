

import 'dart:core';

import 'package:clothes/data/models/order_detail_model.dart';

class OrderModel {

  final String id;
  final String name;
  final String phoneNumber;
  final String address;
  final String accountId;
  final List<OrderDetailModel> orderDetails;

  OrderModel({
  required this.id,
  required this.name,
  required this.phoneNumber,
  required this.address,
  required this.accountId,
  required this.orderDetails
  });

  static OrderModel empty() => OrderModel(id: '', name: '', phoneNumber: '', address: '', accountId: '', orderDetails: []);

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
      data['Id'] = id;
      data['Name'] = name;
      data['PhoneNumber'] = phoneNumber;
      data['Address'] = address;
      data['FlutterAccountId'] = accountId;
      data['ListOrderDetails'] = orderDetails.map((detail) => detail.toJson()).toList();
    return data;
  }

}