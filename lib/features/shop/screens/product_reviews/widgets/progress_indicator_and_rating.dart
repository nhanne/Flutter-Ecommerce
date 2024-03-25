import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/device/device_utility.dart';
import 'package:flutter/material.dart';

class TratingProgressIndicator extends StatelessWidget {
  const TratingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child:  Text('5', style: Theme.of(context).textTheme.bodyMedium)),
        Expanded( 
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context)*0.8,
            child:  LinearProgressIndicator(
          value: value,
          minHeight: 11,
          backgroundColor: TColors.grey,
          borderRadius: BorderRadius.circular(7),
          valueColor: const AlwaysStoppedAnimation(TColors.primary),
        ),
        ),
        ),
      ],
    );
  }
}