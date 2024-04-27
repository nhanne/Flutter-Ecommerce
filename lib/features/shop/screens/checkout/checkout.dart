import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/controllers/cart_controller.dart';
import 'package:clothes/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    Cart cartViewModel = Provider.of<Cart>(context);
    CartController cartController = CartController(cartViewModel);

    return Consumer<Cart>(builder: (context, cartViewModel, child) {
      return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title: Text('Order Review',
                style: Theme.of(context).textTheme.headlineSmall)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Items in Cart
                // TCartItems(
                //     showAddRemoveButtons: false, cartViewModel: cartViewModel),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Billing Section
                TRoundedContainer(
                  showBorder: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      /// Pricing
                      TBillingAmountSection(),

                      /// Divider
                      Divider(),
                      // SizedBox(height: TSizes.spaceBtwItems),

                      /// Payment Methods
                      TBillingPaymentSection(),
                      Divider(),
                      // SizedBox(height: TSizes.spaceBtwItems),

                      /// Address
                      TBillingAddressSection()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => cartController.checkout(),
              child:  Text('Checkout: ${cartViewModel.orderPrice} VNĐ')),
        ),
      );
    });
  }
}
