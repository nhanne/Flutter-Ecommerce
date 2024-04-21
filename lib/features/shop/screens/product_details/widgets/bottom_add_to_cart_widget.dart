import 'package:clothes/api/stocks/stock_model.dart';
import 'package:clothes/common/widgets/icons/t_circular_icon.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/controllers/stock_controller.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = StockController.instance;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(
              children: [
                TCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: TColors.white,
                    width: 40,
                    height: 40,
                    color: TColors.black,
                    onPressed: () {
                      if (controller.quantity > 0) {
                        controller.quantity--;
                      }
                    }),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(controller.quantity.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                    icon: Iconsax.add,
                    backgroundColor: TColors.black,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                    onPressed: () => controller.quantity++)
              ],
            ),
          ),
          Consumer<Cart>(builder: (context, cart, child) {
            return ElevatedButton(
              onPressed: () {
                var cartModel = controller.convertToCartItem(stock);
                if (cartModel != null) {
                  cart.addToCart(cartModel);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Add to Cart'),
            );
          })
        ],
      ),
    );
  }
}
