import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/images/t_circular_image.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              // const Divider(),
              // const SizedBox(height: TSizes.spaceBtwItems),
              //
              // const TSectionHeading(title: 'Profile Information', showActionButton: false),
              // const SizedBox(height: TSizes.spaceBtwItems),
              //
              // TProfileMenu(title: 'Name', value: 'Trần Thanh Nhân', onPressed: () {}),
              // TProfileMenu(title: 'Username', value: 'nhantran', onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: 'Trần Thanh Nhân', icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: 'Email', value: 'nhantran@gmail.com', onPressed: () {}),
              TProfileMenu(title: 'Phone Number', value: '+84 858 032 268', onPressed: () {}),
              // TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              // TProfileMenu(title: 'Date of Birth', value: '9 Dec 2002', onPressed: () {}),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}



