import 'package:clothes/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.3),
      blurRadius: 10,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
  static final horizontalProductShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}