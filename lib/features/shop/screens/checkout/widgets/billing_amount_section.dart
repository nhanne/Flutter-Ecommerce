import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
              Text('9.000.000 VNĐ', style: Theme.of(context).textTheme.labelLarge),
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
              Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
              Text('0 VNĐ', style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
              Text('9.050.000 VNĐ', style: Theme.of(context).textTheme.titleMedium),
            ],
          )
        ],
      ),
    );
  }
}
