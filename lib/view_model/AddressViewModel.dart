import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/model/AddressModel.dart';
import 'package:moon_walker/repository/AddressRepository.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class AddressViewModel extends GetxController{

  var addressType = "".obs;
  final mainViewModel = Get.put(MainViewModel());
  var addressList = <AddressModel>[].obs;
  var addressSearchList = <AddressModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAddresses();
  }

  setAddress(String address){
    addressType.value = address;
  }

  submitAddress(
      String nameController,
      String emailController,
      String phoneController,
      String localityController,
      String cityController,
      String stateController,
      String countryController,
      String pincodeController,
      String addressController,
      BuildContext context)async{

    mainViewModel.setMainLoader(true);

    var result = await AddressRepository.addAddressRepo(
        nameController,
        emailController,
        phoneController,
        localityController,
        cityController,
        stateController,
        countryController,
        pincodeController,
        addressController,
        addressType.value
    );
    if(result == true){
      Navigator.pop(context);
      mainViewModel.setMainLoader(false);
    }else{
      mainViewModel.setMainLoader(false);
    }
  }

  getAllAddresses() async{
    addressSearchList.clear();
    addressList.clear();
    var result = await AddressRepository.getAddressRepo();
    if(result != null){
      addressList.value = result;
      addressSearchList.addAll(addressList);
    }
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    getAllAddresses();
    return null;
  }

  searchOrders(String text)async{
    addressSearchList.clear();
    if(text.isEmpty){
      addressList.forEach((element) {
        addressSearchList.add(element);
      });
    }
    else{
      addressList.forEach((element) {
        if(element.city!.toLowerCase().contains(text)
            || element.state!.toLowerCase().contains(text)
            || element.country!.toLowerCase().contains(text)
            || element.pinCode!.toLowerCase().contains(text)
            || element.address!.toLowerCase().contains(text)
            || element.name!.toLowerCase().contains(text)
            || element.email!.toLowerCase().contains(text)
            || element.phone!.toLowerCase().contains(text)
        )
        {
          addressSearchList.add(element);
        }
      });
    }
  }

}