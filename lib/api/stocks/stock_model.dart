import 'package:clothes/api/products/product_model.dart';

class Stock {
  InfoProduct? product;
  String? cateName;
  List<Size>? sizes;
  List<Color>? colors;

  Stock({this.product, this.sizes, this.colors, this.cateName});

  factory Stock.fromJson(Map<String, dynamic> json) {
    var productJson = json["product"][0];
    var sizesJson = json["sizes"] as List<dynamic>;
    var colorsJson = json["colors"] as List<dynamic>;
    List<Size> listSizes = sizesJson.map((size) => Size.fromJson(size)).toList();
    List<Color> colorSizes = colorsJson.map((color) => Color.fromJson(color)).toList();

    return Stock(
      product: InfoProduct(
        id: productJson['id'],
        name: productJson['name'],
        picture: productJson['image'],
        costPrice: productJson['costPrice'],
        unitPrice: productJson['unitPrice'],
      ),
      sizes: listSizes,
      colors: colorSizes,
      cateName: productJson['category'],
    );
  }
}

class Size {
  Size({this.id, this.name});

  int? id;
  String? name;

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Color {
  Color({this.id, this.name});

  int? id;
  String? name;

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      id: json['id'],
      name: json['name'],
    );
  }
}
