import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
          Text('Trần Thanh Nhân', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(Icons.phone, color: Colors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('+84 858 032 268', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(Icons.location_history, color: Colors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(child: Text('704/74 Nguyen Dinh Chieu, HCMC', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
        ],
      ),
    );
  }
}
