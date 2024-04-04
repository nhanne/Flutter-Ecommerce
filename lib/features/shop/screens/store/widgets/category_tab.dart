import 'package:clothes/common/widgets/brands/brand_show_case.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // const TBrandShowcase(images: [
                //   TImages.productImage3,
                //   TImages.productImage2,
                //   TImages.productImage1
                // ]),
                // const TBrandShowcase(images: [
                //   TImages.productImage3,
                //   TImages.productImage2,
                //   TImages.productImage1
                // ]),
                // const SizedBox(height: TSizes.spaceBtwItems),
                TSectionHeading(
                    title: 'You might like',
                    showActionButton: true,
                    onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical()),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ],
    );
  }
}
