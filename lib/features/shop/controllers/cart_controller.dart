import 'dart:convert';
import 'package:clothes/common/widgets/success_screen/success_screen.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/data/models/order_detail_model.dart';
import 'package:clothes/api/orders/order_model.dart';
import 'package:clothes/features/personalization/controllers/address_controller.dart';
import 'package:clothes/navigation_menu.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  final Cart cartViewModel;

  List<OrderDetailModel> orderDetails = [];

  CartController(this.cartViewModel);

  convertListCartToListOrderDetail() {
    for (Cart cart in cartViewModel.listCarts) {
      OrderDetailModel orderDetail = OrderDetailModel(
          orderId: '',
          stockId: 5,
          quantity: cart.quantity!,
          unitPrice: cart.unitPrice!);
      orderDetails.add(orderDetail);
    }
    return orderDetails;
  }

  String convertOrderDetailsListToJson(List<OrderDetailModel> orderDetails) {
    List<Map<String, dynamic>> orderDetailsJsonList = [];

    for (OrderDetailModel orderDetail in orderDetails) {
      orderDetailsJsonList.add(orderDetail.toJson());
    }

    return json.encode(orderDetailsJsonList);
  }

  Future<void> checkout() async {

    var listAddress = await AddressController.instance.getAllUserAddress();
    if (cartViewModel.listCarts.isEmpty || listAddress.isEmpty) {
      return;
    }
    var selectAddress = AddressController.instance.selectedAddress.value;

    convertListCartToListOrderDetail();
    final user = _auth.currentUser;
    OrderModel orderModel = OrderModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: selectAddress.name,
        phoneNumber: selectAddress.phoneNumber,
        address: selectAddress.toString(),
        accountId: user!.uid,
        orderTime: DateTime.now(),
        orderStatus: 1,
    );
    String jsonOrderModel = convertOrderModelToJson(orderModel);
    try {
      var response = await http.post(
        Uri.parse('https://ttnhan-001-site1.htempurl.com/flutter/checkout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonOrderModel,
      );

      if (response.statusCode == 200) {
        // Xử lý khi request thành công
        cartViewModel.clearCart();
        Get.to(
          () => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ),
        );
      } else {
        TLoaders.errorSnackBar(title: 'Some thing went wrong, please try again later');
      }
    } catch (e) {
      // Xử lý khi có lỗi xảy ra trong quá trình gửi request
      TLoaders.errorSnackBar(title: 'Some thing went wrong, please try again later');
    }
  }

  String convertOrderModelToJson(OrderModel orderModel) {
    Map<String, dynamic> orderModelJson = {
      'Id': orderModel.id,
      'Name': orderModel.name,
      'PhoneNumber': orderModel.phoneNumber,
      'Address': orderModel.address,
      'FlutterAccountId': orderModel.accountId,
      'ListOrderDetails': convertOrderDetailsListToJson(orderDetails),
    };

    return json.encode(orderModelJson);
  }
}
