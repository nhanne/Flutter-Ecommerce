import 'package:clothes/common/widgets/icons/t_circular_icon.dart';
import 'package:clothes/common/widgets/images/t_rounded_image.dart';
import 'package:clothes/common/widgets/texts/product_title_text.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cart, this.showRemoveButton = false,
  });
  final Cart cart;
  final bool showRemoveButton;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cartModel, child){
      return Row(
        children: [
          /// Image
          TRoundedImage(
              imageUrl: TImages.productImage + cart.picture!,
              width: 60,
              height: 60,
              isNetworkImage: true,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light),
          const SizedBox(width: TSizes.spaceBtwItems),

          /// Title, Price & Size
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TBrandTitleWithVerifiedIcon(title: cart.),
                Flexible(child: TProductTitleText(title: cart.productName!, maxLines: 1)),
                /// Attributes
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: 'Màu sắc ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: cart.colorName, style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: ' Kích cỡ ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: cart.sizeName, style: Theme.of(context).textTheme.bodyLarge),
                        ]
                    )
                ),
              ],
            ),
          ),
          TCircularIcon(
            icon: Iconsax.trash,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            onPressed: (){
              cartModel.removeFromCartDialog(cart);
            },
            backgroundColor: TColors.error,
          ),
        ],
      );
    });
  }
}