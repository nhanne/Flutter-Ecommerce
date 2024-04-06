import 'package:clothes/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
        child: Container(
          color: dark ? TColors.darkGrey : TColors.light,
          child: const Stack(
            children: [
              SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Image(image: AssetImage(TImages.productImage5))),
                ),
              ),
              // Positioned(
              //   right: 0,
              //   bottom: 30,
              //   left: TSizes.defaultSpace,
              //   child: SizedBox(
              //     height: 80,
              //     child: ListView.separated(
              //       itemCount: 4,
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       physics: const AlwaysScrollableScrollPhysics(),
              //       separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems),
              //       itemBuilder: (_, index) => TRoundedImage(
              //           width: 80,
              //           backgroundColor: dark ? TColors.dark : TColors.white,
              //           border: Border.all(color: TColors.primary),
              //           padding: const EdgeInsets.all(TSizes.sm),
              //           imageUrl: TImages.productImage3
              //       ),
              //     ),
              //   ),
              // ),

              /// Appbar Icons
            ],
          ),
        )
    );
  }
}
