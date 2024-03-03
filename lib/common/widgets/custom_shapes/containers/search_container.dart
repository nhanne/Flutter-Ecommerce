import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/device/device_utility.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showBorder = true,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? dark ? TColors.dark : TColors.light : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal, color: TColors.darkerGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Search in Store', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),

      ),
    );
  }
}