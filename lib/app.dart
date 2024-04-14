import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/text_strings.dart';
import 'package:clothes/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      // home: const OnBoardingScreen(),
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: TColors.white))),
    );
  }
}
