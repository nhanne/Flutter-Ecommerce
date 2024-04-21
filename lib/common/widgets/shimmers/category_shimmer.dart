

import 'package:clothes/common/widgets/shimmers/shimmer.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class TCategoryShimmer extends StatelessWidget{
  final int itemCount;

  const TCategoryShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
          itemCount: itemCount,
        itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(width: 55, height: 55),
                SizedBox(height: TSizes.spaceBtwItems/2),

                TShimmerEffect(width: 55, height: 8)
              ],
            );
        },
      ),
    );
  }
}