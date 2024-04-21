import 'package:clothes/common/styles/spacing_styles.dart';
import 'package:clothes/common/widgets/login_signup/form_diveder.dart';
import 'package:clothes/common/widgets/login_signup/social_buttons.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TLoginHeader(),
              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.defaultSpace),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}






