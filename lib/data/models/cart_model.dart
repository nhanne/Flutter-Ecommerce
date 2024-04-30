import 'package:clothes/util/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Cart with ChangeNotifier {
  Cart({
    this.idProduct,
    this.idColor,
    this.idSize,
    this.idStock,
    this.productName,
    this.sizeName,
    this.colorName,
    this.picture,
    this.unitPrice,
    this.quantity,
    this.brand,
  });

  int? idProduct;
  int? idColor;
  int? idSize;
  int? idStock;
  String? productName;
  String? sizeName;
  String? colorName;
  String? picture;
  int? unitPrice;
  int? quantity;
  String? brand;

  var listCarts = <Cart>[];
  var isLoading = true;

  int get countCart => listCarts.length;

  int get totalPrice => (quantity! * unitPrice!);

  String get getPrice => NumberFormat.decimalPattern().format(unitPrice);

  int get countItemCart => listCarts.fold(
      0, (previousValue, item) => previousValue + item.quantity!);

  int get totalPriceCart => listCarts.fold(
      0,
      (previousValue, item) =>
          previousValue + (item.unitPrice! * item.quantity!));

  String get orderPrice =>
      (NumberFormat.decimalPattern().format(totalPriceCart + 50000)).toString();

  setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  addToCart(Cart item) {
    Cart checkCart = listCarts.firstWhere(
        (cartItem) =>
            cartItem.idProduct == item.idProduct &&
            cartItem.idSize == item.idSize &&
            cartItem.idProduct == item.idProduct,
        orElse: () => item);

    if (listCarts.contains(checkCart)) {
      checkCart.quantity = (checkCart.quantity! + item.quantity!);
    } else {
      listCarts.add(item);
    }
    TLoaders.customToast(message: 'Sản phẩm của bạn đã được thêm vào giỏ hàng');
    notifyListeners();
  }

  removeFromCart(Cart item) {
    listCarts.remove(item);
    TLoaders.customToast(message: 'Sản phẩm của bạn đã bị xóa khỏi Giỏ hàng');
    notifyListeners();
  }

  clearCart() {
    listCarts.clear();
    notifyListeners();
  }

  minutesQuantity(Cart item) {
    if (item.quantity == 0) return;
    if (item.quantity == 1) {
      removeFromCartDialog(item);
    } else {
      item.quantity = (item.quantity! - 1);
    }
    notifyListeners();
  }

  addQuantity(Cart item) {
    item.quantity = (item.quantity! + 1);
    notifyListeners();
  }

  void removeFromCartDialog(Cart item) {
    Get.defaultDialog(
        title: 'Xác nhận Xóa',
        middleText: 'Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng không?',
        onConfirm: () {
          removeFromCart(item);
          Get.back();
        },
        onCancel: () => () => Get.back);
  }
}
