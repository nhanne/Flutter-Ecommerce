import 'package:clothes/common/widgets/images/t_circular_image.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text('Trần Thanh Nhân', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text('nhantran.netdev@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}