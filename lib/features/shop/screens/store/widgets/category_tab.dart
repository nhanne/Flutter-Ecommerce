import 'package:clothes/api/categories/category_model.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/features/shop/controllers/product_controller.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    final products = ProductController.instance.products.where((item) => item.cateName == category.name).toList();
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // TSectionHeading(
                //     title: category.name!,
                //     showActionButton: false,
                //     onPressed: () => Get.to(() => const AllProducts())),
                // const SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(product: products[index])),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ],
    );
  }
}
