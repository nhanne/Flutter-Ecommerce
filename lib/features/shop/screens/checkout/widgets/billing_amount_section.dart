import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Consumer<Cart>(builder: (context, cartViewModel, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tổng', style: Theme.of(context).textTheme.bodyMedium),
                Expanded(
                    child: Text(
                        '${NumberFormat.decimalPattern().format(cartViewModel.totalPriceCart)} VNĐ',
                         style: Theme.of(context).textTheme.labelLarge,
                         textAlign: TextAlign.right)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phí vận chuyển',
                    style: Theme.of(context).textTheme.bodyMedium),
                Expanded(
                  child: Text('50.000 VNĐ',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.right),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tổng tiền đơn hàng',
                    style: Theme.of(context).textTheme.bodyMedium),
                Expanded(
                  child: Text('${cartViewModel.orderPrice} VNĐ',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.right),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
