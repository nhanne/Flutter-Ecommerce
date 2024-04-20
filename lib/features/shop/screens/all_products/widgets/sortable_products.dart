import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/features/shop/controllers/product_controller.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProduct extends StatefulWidget {
  const TSortableProduct({
    super.key,
  });
  
  @override
  State<TSortableProduct> createState() => _TSortableProductState();
}

class _TSortableProductState extends State<TSortableProduct> {
  late ProductController controller;
  @override
  void initState() {
    super.initState();
    controller = ProductController.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            onSortClicked(value!);
          },
          items: ['Higher Price', 'Name', 'Lower Price', 'Sale', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///Products
        Obx(
          () => TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }

  void onSortClicked(String sort){
    setState(() {
       controller.sortProducts(sort);
    });
  }
}