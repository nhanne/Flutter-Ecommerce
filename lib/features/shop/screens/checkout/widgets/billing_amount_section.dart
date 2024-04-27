import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Consumer<Cart>(builder: (context, cartViewModel, child) {
      return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
                Text('${NumberFormat.decimalPattern().format(cartViewModel.totalPriceCart)} VNĐ', style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
                Text('50.000 VNĐ', style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
                Text('${cartViewModel.orderPrice} VNĐ', style: Theme.of(context).textTheme.titleMedium),
              ],
            )
          ],
        );
      }
      ),
    );
  }
}
