import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/features/shop/screens/checkout/checkout.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256.0')),
      ),
    );
  }
}




