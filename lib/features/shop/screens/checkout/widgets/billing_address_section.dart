import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/features/personalization/controllers/address_controller.dart';
import 'package:clothes/features/personalization/screens/address/address.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(
        () {
          final controller = AddressController.instance;
          final selectAddress = controller.selectedAddress.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(
                  title: 'Shipping Address',
                  buttonTitle: 'Change',
                  onPressed: () => Get.to(() => const UserAddressScreen())),
              Text(selectAddress.name,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text(selectAddress.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history,
                      color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: Text(selectAddress.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
            ],
          );
        },
      ),
    );
  }
}
