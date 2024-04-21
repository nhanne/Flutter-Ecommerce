import 'package:clothes/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          TSectionHeading(title: 'Payment Method', buttonTitle: '', onPressed: (){}),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: const Image(image: AssetImage(TImages.applePay), fit: BoxFit.contain),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text('Cash on Delivery', style: Theme.of(context).textTheme.bodyLarge),
            ],
          )
        ],
      ),
    );
  }
}