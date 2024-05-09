import 'package:clothes/features/shop/screens/wishlist/wishlist.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';
import 'util/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(()
        => NavigationBar(
          height: 80,
          elevation: 1,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.light,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.primary,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home', selectedIcon: Icon(Iconsax.home, color: Colors.white)),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store', selectedIcon: Icon(Iconsax.home, color: Colors.white)),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist', selectedIcon: Icon(Iconsax.home, color: Colors.white)),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile', selectedIcon: Icon(Iconsax.home, color: Colors.white)),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [ const HomeScreen(), const StoreScreen(),const FavouriteScreen(), const SettingsScreen()];
}