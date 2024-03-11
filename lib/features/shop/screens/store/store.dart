import 'package:clothes/common/widgets/appbar/tabbar.dart';
import 'package:clothes/common/widgets/brands/brand_cart.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/section_heading.dart';
import 'package:clothes/features/shop/screens/store/widgets/category_tab.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // appBar: TAppBar(
        //   title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        //   actions: [TCartCounterIcon(onPressed: () {}, iconColor: TColors.white)],
        // ),
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
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        const TSectionHeading(
                            title: 'Featured Brands', showActionButton: true),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(showBorder: false);
                            })
                      ],
                    ),
                  ),

                  /// Tabs
                  bottom: const TTabBar(
                    tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )
        ),
      ),
    );
  }
}







