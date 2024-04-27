import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/controllers/stock_controller.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/text_strings.dart';
import 'package:clothes/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'bindings/general_bindings.dart';
import 'features/personalization/controllers/address_controller.dart';
import 'features/shop/controllers/category_controller.dart';
import 'features/shop/controllers/product_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    Get.put(ProductController());
    Get.put(StockController());
    Get.put(AddressController());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (__) => Product()),
      ],
      child: GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        // home: const OnBoardingScreen(),
        home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: TColors.white))),
      ),
    );
  }
}
