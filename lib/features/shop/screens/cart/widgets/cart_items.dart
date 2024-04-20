import 'package:clothes/common/widgets/products/cart/add_remove_button.dart';
import 'package:clothes/common/widgets/products/cart/cart_item.dart';
import 'package:clothes/common/widgets/texts/product_price_text.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<Cart>(context, listen: false);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: cartViewModel.countCart,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove Button Row with total Price
          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '4.500.000'),
            ],
          )
        ],
      ),
    );
  }
}
