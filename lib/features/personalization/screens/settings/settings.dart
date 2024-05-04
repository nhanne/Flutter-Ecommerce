import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:clothes/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:clothes/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/features/authentication/screens/login/login.dart';
import 'package:clothes/features/personalization/screens/address/address.dart';
import 'package:clothes/features/personalization/screens/order/order.dart';
import 'package:clothes/features/personalization/screens/profile/profile.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const videoURL = "https://youtu.be/zoss7NamS-U";
    final YoutubePlayerController controller;
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                      title: Text('Tài khoản',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TUserProfileTitle(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Cài đặt tài khoản', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Địa chỉ của tôi',
                    subTitle: 'Đặt địa chỉ giao hàng mua sắm',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  // TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, Remove products and move to checkout', onTap: (){}),
                  // TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account', onTap: (){}),
                  // TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons', onTap: (){}),
                  // TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: (){}),
                  // TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts', onTap: (){}),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'Đơn hàng của tôi',
                    subTitle: 'Đơn hàng đang thực hiện và đã hoàn thành',
                    onTap: () => Get.to(() => const OrderScreen()),
                    ),
                  // const SizedBox(height: TSizes.spaceBtwSections),
                  // const TSectionHeading(title: 'App Setting', showActionButton: false),
                  // const SizedBox(height: TSizes.spaceBtwItems),
                  // const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.location,
                  //   title: 'Geolocation',
                  //   subTitle: 'Set recommendation based on location',
                  //   trailing: Switch(value: true, onChanged: (value){}),
                  // ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.security_user,
                  //   title: 'Safe Mode',
                  //   subTitle: 'Search result is safe for all ages',
                  //   trailing: Switch(value: false, onChanged: (value){}),
                  // ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.location,
                  //   title: 'HD Image Quality',
                  //   subTitle: 'Set image quality to be seen',
                  //   trailing: Switch(value: false, onChanged: (value){}),
                  // ),
                  //
                  // const SizedBox(height: TSizes.spaceBtwSections),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                    onReady: () => debugPrint('Ready'),
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent
                        )
                      ),
                      const PlaybackSpeedButton()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () => Get.to(() => const LoginScreen()),
              child: const Text('Đăng xuất')),
        ),
      ),
    );
  }
}
