import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/products/cart/add_remove_button.dart';
import 'package:clothes/common/widgets/products/cart/cart_item.dart';
import 'package:clothes/common/widgets/texts/product_price_text.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
            itemBuilder: (_, index) => const Column(
              children: [
                TCartItem(),
                SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 70),
                        TProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                    TProductPriceText(price: '256'),
                  ],
                )
              ],
            ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: const Text('Checkout \$256.0')),
      ),
    );
  }
}




