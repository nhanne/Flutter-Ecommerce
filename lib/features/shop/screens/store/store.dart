import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/appbar/tabbar.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:clothes/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:clothes/features/shop/controllers/category_controller.dart';
import 'package:clothes/features/shop/screens/store/widgets/category_tab.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCartCounterIcon(onPressed: () {}, iconColor: TColors.black)],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  // expandedHeight: 440,
                  expandedHeight: 130,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: TSizes.spaceBtwItems),
                        TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),
                        // const SizedBox(height: TSizes.spaceBtwSections),
                        // const TSectionHeading(
                        //     title: 'Featured Brands', showActionButton: true),
                        // const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        // TGridLayout(
                        //     itemCount: 4,
                        //     mainAxisExtent: 80,
                        //     itemBuilder: (_, index) {
                        //       return const TBrandCard(showBorder: false);
                        //     })
                      ],
                    ),
                  ),

                  /// Tabs
                  bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
                ),
              ];
            },
            body: TabBarView(
              children: categories.map((category) => TCategoryTab(category: category)).toList(),
            )
        ),
      ),
    );
  }
}







