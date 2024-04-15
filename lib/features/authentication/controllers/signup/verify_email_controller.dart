import 'dart:async';

import 'package:clothes/common/widgets/success_screen/success_screen.dart';
import 'package:clothes/data/repositories/authentication/authentication_repository.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/text_strings.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  /// Send mail whenever verify screen appears & Set timer for auto redirect
  @override
  void onInit(){
    sendMailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendMailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email sent',message: 'Please check your email');
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.offAll(
            () => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
        );
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.offAll(
            () => SuccessScreen(
          image: TImages.successfulPaymentIcon,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}