


import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/constants/text_strings.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 130,
          image: AssetImage(
              dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}