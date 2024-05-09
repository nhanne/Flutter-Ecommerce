import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/screens/checkout/checkout.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cartViewModel, child) {
      return Scaffold(
          appBar: TAppBar(
              showBackArrow: true,
              title: Text('Giỏ hàng',
                  style: Theme.of(context).textTheme.headlineSmall)),
          body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TCartItems(cartViewModel: cartViewModel),
          ),

          /// Checkout Button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              child: Text(
                  'Tổng: ${NumberFormat.decimalPattern().format(cartViewModel.totalPriceCart)} VNĐ'),
            ),
          ));
    });
  }
}
