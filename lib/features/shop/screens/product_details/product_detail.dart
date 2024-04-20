import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Product Detail',
          style: Theme.of(context).textTheme.headlineSmall)),
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(product: product),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  // const TRatingAndShare(),

                  /// Price, Title, Stock & Brand
                  TProductMetaData(product: product),

                  /// Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  // const TSectionHeading(title: 'Description'),
                  // const SizedBox(height: TSizes.spaceBtwItems),
                  // const ReadMoreText(
                  //   'This is aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                  //   trimLines: 2,
                  //   trimMode: TrimMode.Line,
                  //   trimCollapsedText: 'Show more',
                  //   trimExpandedText: 'Less',
                  //   moreStyle:
                  //       TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  //   lessStyle:
                  //       TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  // ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const TSectionHeading(
                  //         title: 'Review (199)', showActionButton: false),
                  //     IconButton(
                  //         icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                  //
                  //   ],
                  // ),
                  // const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
