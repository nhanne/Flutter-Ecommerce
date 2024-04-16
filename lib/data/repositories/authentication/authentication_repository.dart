

import 'package:clothes/features/authentication/screens/login/login.dart';
import 'package:clothes/features/authentication/screens/onboarding/onboarding.dart';
import 'package:clothes/features/authentication/screens/signup/verify_email.dart';
import 'package:clothes/navigation_menu.dart';
import 'package:clothes/util/exceptions/firebase_auth_exceptions.dart';
import 'package:clothes/util/exceptions/firebase_exceptions.dart';
import 'package:clothes/util/exceptions/format_exceptions.dart';
import 'package:clothes/util/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app Launch
  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to determine the relevant screen and redirect accordingly
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      // If the user is logged in
      if(user.emailVerified){
        // If the user's email is verified, navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(const OnBoardingScreen()); // Redirect to Onboarding Screen if it's the first time
    }
  }


  /// Email & Password Sign In

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }









  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
}