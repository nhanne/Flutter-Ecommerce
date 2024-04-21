import 'package:clothes/api/stocks/stock_model.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:clothes/common/widgets/images/t_circular_image.dart';
import 'package:clothes/common/widgets/texts/product_price_text.dart';
import 'package:clothes/common/widgets/texts/product_title_text.dart';
import 'package:clothes/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/enums.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final product = stock.product!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(product.saleTag,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(product.getCostPrice,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: TProductPriceText(
                  price: product.getPrice, isLarge: true, maxLines: 2),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: product.name!),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            TCircularImage(
              image: TImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: stock.cateName!,
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
