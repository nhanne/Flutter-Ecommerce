import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Danh sách yêu thích', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Consumer<Product>(
                  builder: (context, productViewModel, child) {
                    return TGridLayout(itemCount: productViewModel.listFavouriteProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: productViewModel.listFavouriteProducts[index]));
                  },
                )
              ],
            ),
        ),
      ),
    );
  }
}
