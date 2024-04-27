import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/features/shop/controllers/product_controller.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  final controller = ProductController.instance;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    products = controller.products
        .where((item) =>
            item.infoProduct!.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: const TAppBar(title: Text('Search Product'), showBackArrow: true),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: TSizes.defaultSpace + 60),
                  child: TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                            product: products[index],
                          )),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
            color: Colors.white,
            child: TextField(
              onChanged: (text) {
                setState(() {
                  query = text;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
