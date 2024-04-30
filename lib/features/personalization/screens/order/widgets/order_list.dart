import 'package:clothes/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:clothes/features/personalization/controllers/order_controller.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return Obx(() {
      final dark = THelperFunctions.isDarkMode(context);
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.orders.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_, index) => TRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              //// Row 1
              Row(
                children: [
                  /// 1 -Icon
                  const Icon(Iconsax.clock),
                  const SizedBox(width: TSizes.spaceBtwItems / 2),

                  /// 2 -Status & Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller
                              .getStatus(controller.orders[index].orderStatus),
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text(controller.getOrderTime(controller.orders[index].orderTime),
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),

                  /// 3 - Icon
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_34,
                          size: TSizes.iconSm)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// row2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        /// 1 -Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),

                        /// 2 -Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Id',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text(controller.orders[index].id,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// row3
                  Expanded(
                      child: Row(
                    children: [
                      /// 1 -Icon
                      const Icon(Iconsax.clock),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// 2 -Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ngày vận chuyển',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text(controller.getShipTime(controller.orders[index].orderTime),
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ])),
      );
    });
  }
}
