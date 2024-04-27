import 'dart:core';

class OrderModel {

  final String id;
  final String name;
  final String phoneNumber;
  final String address;
  final String accountId;
  final DateTime orderTime;
  final int orderStatus;

  OrderModel({
  required this.id,
  required this.name,
  required this.phoneNumber,
  required this.address,
  required this.accountId,
  required this.orderTime,
  required this.orderStatus,
  });

  static OrderModel empty() => OrderModel(id: '', name: '', phoneNumber: '', address: '', accountId: '', orderTime: DateTime.now(), orderStatus: 0);

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
      data['Id'] = id;
      data['Name'] = name;
      data['PhoneNumber'] = phoneNumber;
      data['Address'] = address;
      data['FlutterAccountId'] = accountId;
    return data;
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      accountId: json['flutterAccountId'],
      orderTime: DateTime.parse(json['orderTime']),
      orderStatus: json['orderStatus'],
    );
  }
}