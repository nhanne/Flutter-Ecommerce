import 'package:clothes/api/orders/api_orders.dart';
import 'package:clothes/api/orders/order_model.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  RxList<OrderModel> orders = <OrderModel>[].obs;
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  String getStatus(int status){
    switch(status){
      case 0:
        return 'Mới';
      case 1:
        return 'Chờ xử lí';
      case 2:
        return 'Đã hủy';
      case 3:
        return 'Hoàn thành';
    }
    return 'không tìm thấy';
  }

  String formatDate(DateTime dateTime){
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    return '$day-$month-$year';
  }
  
  String getOrderTime(DateTime orderTime){
    return formatDate(orderTime);
  }

  String getShipTime(DateTime orderTime){
    DateTime shipTime = orderTime.add(const Duration(days: 3));
    return formatDate(shipTime);
  }

  @override
  Future<void> onInit() async {
    await fetchOrdersAPI();
    super.onInit();
  }

  Future<void> fetchOrdersAPI() async {
    await APIOrders.fetchOrders(authUser!.uid).then((dataFromServer) async {
      try {
        orders.assignAll(dataFromServer);
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Lỗi!', message: e.toString());
      }
    });
  }
}