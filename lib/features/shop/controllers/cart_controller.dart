import 'package:clothes/api/stocks/stock_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice =0.0.obs;
  RxInt productQuantityInCart =0.obs;
  RxList<Stock> cartItems = <Stock>[].obs;



}