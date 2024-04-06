import 'package:clothes/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/common/widgets/texts/section_heading.dart';
import 'package:clothes/features/shop/screens/all_products/all_products.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/home_appbar.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// SearchBar
                  TSearchContainer(
                    text: 'Search In Store',
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Categories
                  // Padding(
                  //   padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  //   child: Column(
                  //     children: [
                  //       TSectionHeading(title: 'Popular Categories',showActionButton: false,textColor: TColors.white),
                  //       SizedBox(height: TSizes.spaceBtwItems),
                  //       THomeCategories()
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: TSizes.spaceBtwSections),

                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  ///heading
                  TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
