import 'package:clothes/data/repositories/user/user_repository.dart';
import 'package:clothes/features/personalization/controllers/user_controller.dart';
import 'package:clothes/features/personalization/screens/profile/profile.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:clothes/util/login_signup/network_manager.dart';
import 'package:clothes/util/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try{
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.dockerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated.');
      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}