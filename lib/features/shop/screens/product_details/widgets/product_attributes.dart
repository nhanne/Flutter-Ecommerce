import 'package:clothes/api/stocks/stock_model.dart';
import 'package:clothes/common/widgets/chips/choice_chip.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/features/shop/controllers/stock_controller.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final controller = StockController.instance;
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Màu sắc', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  stock.colors!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Obx(
                      () => TChoiceChip(
                        text: stock.colors![index].name!,
                        selected: stock.colors![index].id! ==
                            controller.selectedColor.value,
                        id: stock.colors![index].id!,
                        onSelected: (value) {
                          controller.selectedColor.value =
                              stock.colors![index].id!;
                          controller.colorName.value = stock.colors![index].name!;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Kích cỡ', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  stock.sizes!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Obx(
                      () => TChoiceChip(
                        text: stock.sizes![index].name!,
                        selected: stock.sizes![index].id! ==
                            controller.selectedSize.value,
                        id: stock.sizes![index].id!,
                        onSelected: (value) {
                          controller.selectedSize.value =
                              stock.sizes![index].id!;
                          controller.sizeName.value = stock.sizes![index].name!;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
