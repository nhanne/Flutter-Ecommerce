import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/screens/cart/cart.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
    this.iconData = Iconsax.shopping_bag,
  });

  final VoidCallback onPressed;
  final Color iconColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(iconData, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: TColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Consumer<Cart>(builder: (context, cartModel, child) {
                return Center(
                  child: Text(cartModel.countItemCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.white, fontSizeFactor: 0.8)),
                );
              })),
        ),
      ],
    );
  }
}
