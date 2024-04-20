import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:clothes/common/widgets/shimmers/shimmer.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/personalization/controllers/user_controller.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
          Obx(() {
            if(controller.profileLoading.value){
              // Display a shimmer loader while user profile is being loaded
              return const TShimmerEffect(width: 80, height: 15);
            }else{
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: [
        Consumer<Cart>(
            builder: (context, data, child){
              return TCartCounterIcon(
                  countItem: data.countCart.toString(),
                  onPressed: () {},
                  iconColor: TColors.white);
            }
        )
      ],
    );
  }
}
