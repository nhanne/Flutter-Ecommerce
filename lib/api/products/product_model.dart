import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Product extends ChangeNotifier{
  InfoProduct? infoProduct;
  String? cateName;

  Product({this.infoProduct, this.cateName});

  Product.fromJson(Map<String, dynamic> json) {
    infoProduct = json['p'] != null ? InfoProduct.fromJson(json['p']) : null;
    cateName = json['cateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (infoProduct != null) {
      data['p'] = infoProduct!.toJson();
    }
    data['cateName'] = cateName;
    return data;
  }
}

class InfoProduct {
  int? id;
  int? categoryId;
  String? picture;
  String? name;
  String? code;
  int? costPrice;
  int? unitPrice;
  int? sold;
  int? sale;
  String? stockInDate;

  InfoProduct(
      {this.id,
      this.categoryId,
      this.picture,
      this.name,
      this.code,
      this.costPrice,
      this.unitPrice,
      this.sold,
      this.sale,
      this.stockInDate});

  String get getPrice => NumberFormat.decimalPattern().format(unitPrice);
  String get getCostPrice{
    if(costPrice!.compareTo(unitPrice as num) > 0){
      return '${NumberFormat.decimalPattern().format(costPrice)} VNĐ';
    }
    else{
      return "";
    }
  }
  // String get getCostPrice => NumberFormat.decimalPattern().format(costPrice);
  String get saleTag{
    if(sale != null){
      return "$sale%";
    }
    else{
      return "Hot";
    }
  }

  InfoProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    picture = json['picture'];
    name = json['name'];
    code = json['code'];
    costPrice = json['costPrice'];
    unitPrice = json['unitPrice'];
    sold = json['sold'];
    sale = json['sale'];
    stockInDate = json['stockInDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryId'] = categoryId;
    data['picture'] = picture;
    data['name'] = name;
    data['code'] = code;
    data['costPrice'] = costPrice;
    data['unitPrice'] = unitPrice;
    data['sold'] = sold;
    data['sale'] = sale;
    data['stockInDate'] = stockInDate;
    return data;
  }


}
