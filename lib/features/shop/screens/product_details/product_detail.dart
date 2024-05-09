import 'package:clothes/api/stocks/stock_model.dart';
import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/controllers/stock_controller.dart';
import 'package:clothes/features/shop/screens/cart/cart.dart';
import 'package:clothes/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final controller = StockController.instance;
    final cart = Provider.of<Cart>(context, listen: false);
    controller.reset();
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Chi tiết sản phẩm',
            style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          TCartCounterIcon(
            onPressed: () => Get.to(const CartScreen()),
            iconColor: TColors.black,
          )
        ],
      ),
      bottomNavigationBar: TBottomAddToCart(stock: stock),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(image: stock.product!.picture!),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  // const TRatingAndShare(),

                  /// Price, Title, Stock & Brand
                  TProductMetaData(stock: stock),

                  /// Attributes
                  TProductAttributes(stock: stock),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            var cartModel = controller.convertToCartItem(stock);
                            if (cartModel != null) {
                              cart.addToCart(cartModel);
                              Get.to(() => const CartScreen());
                            }
                          }, child: const Text('Mua ngay'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
