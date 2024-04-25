import 'package:clothes/data/models/address_model.dart';
import 'package:clothes/data/repositories/address_repository.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/helpers/network_manager.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:clothes/util/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> getAllUserAddress() async {
    try{
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try{

      // Clear the 'selected' field
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
        }

        newSelectedAddress.selectedAddress = true;
        selectedAddress.value = newSelectedAddress;

        await addressRepository.updateSelectedField(selectedAddress.value.id, true);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error in Selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try{
      TFullScreenLoader.openLoadingDialog('Starting Address...', TImages.dockerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!addressFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          country: country.text.trim()
      );
      final id = await addressRepository.addAddress(address);

      // Update selected address status
      address.id = id;
      selectedAddress(address);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully');

      refreshData.toggle();

      resetFormFields();
      
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

}