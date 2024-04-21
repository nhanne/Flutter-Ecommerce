import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/features/shop/controllers/product_controller.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance => Get.find();

  final productController = ProductController.instance;

  Future<List<Product>> fetchProductsByQuery(Query? query) async {
    try{
      if(query == null) return [];
      final products = productController.products;
      return products;
    }
    catch (e){
     TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
     return [];
    }
  }

}