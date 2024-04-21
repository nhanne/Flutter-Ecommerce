import 'package:clothes/common/widgets/products/cart/add_remove_button.dart';
import 'package:clothes/common/widgets/products/cart/cart_item.dart';
import 'package:clothes/common/widgets/texts/product_price_text.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true, required this.cartViewModel});

  final bool showAddRemoveButtons;
  final Cart cartViewModel;

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      shrinkWrap: true,
      itemCount: cartViewModel.countCart,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          TCartItem(cart: cartViewModel.listCarts[index], showRemoveButton: true),
          if (showAddRemoveButtons)
            const SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove Button Row with total Price
          if (showAddRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 70),
                    TProductQuantityWithAddRemoveButton(
                        cart: cartViewModel.listCarts[index]),
                  ],
                ),
                TProductPriceText(
                    price: cartViewModel.listCarts[index].getPrice)
              ],
            )
        ],
      ),
    );
  }
}
