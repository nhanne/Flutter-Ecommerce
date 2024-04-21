import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/images/t_rounded_image.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget{
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TRoundedImage(imageUrl: TImages.promoBanner3, width: double.infinity, applyImageRadius: true),
                const SizedBox(height: TSizes.spaceBtwSections),

                Column(
                  children: [
                    TSectionHeading(title: 'Sport shirts', onPressed: (){}),
                    const SizedBox(height: TSizes.spaceBtwItems/2),
                  ],
                )
              ],
            ),
        ),
      ),
    );
  }

}