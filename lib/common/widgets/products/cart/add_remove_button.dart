import 'package:clothes/common/widgets/icons/t_circular_icon.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cartViewModel, child) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TCircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: TSizes.md,
            onPressed: () {
              cartViewModel.minutesQuantity(cart);
            },
            color: THelperFunctions.isDarkMode(context)
                ? TColors.white
                : TColors.black,
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkGrey
                : TColors.light,
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text(cart.quantity.toString(),
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: TSizes.spaceBtwItems),
          TCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            onPressed: () {
              cartViewModel.addQuantity(cart);
            },
            color: TColors.white,
            backgroundColor: TColors.primary,
          ),
        ],
      );
    });
  }
}
