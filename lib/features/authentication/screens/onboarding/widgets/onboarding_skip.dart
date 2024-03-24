import 'package:clothes/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:clothes/features/shop/screens/home/home.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () {},
          child: TextButton( onPressed: () =>  Get.to(() => const HomeScreen()), child: const Text('Skip')),
        ));
  }
}
