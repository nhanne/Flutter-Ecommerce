import 'package:clothes/common/widgets/chips/choice_chip.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TRoundedContainer(
        //   padding: const EdgeInsets.all(TSizes.md),
        //   backgroundColor: dark ? TColors.darkGrey : TColors.grey,
        //   child: Column(
        //     children: [
        //       Row(
        //         children: [
        //           const TSectionHeading(title: 'Variation', showActionButton: false),
        //           const SizedBox(width: TSizes.spaceBtwItems),
        //
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                   children: [
        //                     const TProductTitleText(title: 'Price: ', smallSize: true),
        //                     Text(
        //                       '\$25',
        //                       style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
        //                     ),
        //                     const SizedBox(width: TSizes.spaceBtwItems),
        //                     const TProductPriceText(price: '20')
        //                   ]
        //               ),
        //               Row(
        //                 children: [
        //                   const TProductTitleText(title: 'Stock', smallSize: true),
        //                   Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
        //                 ],
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //
        //       const TProductTitleText(
        //           title: 'This is the Description of The Product and it can go up to max 4 lines',
        //           smallSize: true,
        //           maxLines: 4,
        //       )
        //     ],
        //   ),
        // ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Color', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'White', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'Blue', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'Black', selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'M', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'L', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'XL', selected: false, onSelected: (value){}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
