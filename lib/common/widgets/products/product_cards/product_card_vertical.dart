import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/common/styles/shadow.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:clothes/common/widgets/images/t_rounded_image.dart';
import 'package:clothes/common/widgets/texts/product_price_text.dart';
import 'package:clothes/common/widgets/texts/product_title_text.dart';
import 'package:clothes/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:clothes/features/shop/controllers/stock_controller.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = StockController.instance;

    return GestureDetector(
      onTap: () => controller.fetchStockAPI(product.infoProduct!.id.toString()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  TRoundedImage(
                      imageUrl: TImages.productImage +
                          product.infoProduct!.picture.toString(),
                      applyImageRadius: true,
                      isNetworkImage: true),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.primary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(product.infoProduct!.saleTag,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),

                  /// Favourite Icon Button
                  // Consumer<Product>(
                  //   builder: (context, productModel, child) {
                  //     return Positioned(
                  //         top: 0,
                  //         right: 0,
                  //         child: Obx(() {
                  //           return const TCircularIcon(
                  //               icon: Iconsax.heart5, color: Colors.red);
                  //         }));
                  //   },
                  // )
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                      title: product.infoProduct!.name.toString(),
                      smallSize: true,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: product.cateName!),
                  ],
                ),
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(
                      price: product.infoProduct!.getPrice.toString(),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconMd * 1.2,
                    height: TSizes.iconMd * 1.2,
                    child:
                        Center(child: Icon(Iconsax.add, color: TColors.white)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
