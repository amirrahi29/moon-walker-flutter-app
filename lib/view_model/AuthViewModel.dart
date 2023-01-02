import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/repository/AuthRepository.dart';
import 'package:get/get.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class AuthViewModel extends GetxController {
  var isSendOtp = false.obs;
  var isVerifyOtp = false.obs;
  var isResendSmsBtnEnabled = false.obs;
  var isLogoutLoader = false.obs;

  sendOTPVM(String phoneNumber) async {
    isSendOtp.value = true;
    var result = await AuthRepository.sendOTPRepo(phoneNumber);
    if (result == true) {
      isSendOtp.value = false;
      Get.toNamed(RoutesGetters.getOTPRoute(), arguments: phoneNumber);
    } else {
      isSendOtp.value = false;
    }
  }

  reSendOTPVM(String phoneNumber, BuildContext context) async {
    isVerifyOtp.value = true;
    var result = await AuthRepository.reSendOTPRepo(phoneNumber);
    if (result == true) {
      isResendSmsBtnEnabled.value = false;
      isVerifyOtp.value = false;
      //refresh page with paramters start
      Get.offAndToNamed(RoutesGetters.getOTPRoute(), arguments: phoneNumber);
      //refresh page with paramters end
    } else {
      isResendSmsBtnEnabled.value = false;
      isVerifyOtp.value = false;
    }
  }

  verifyOTPVM(String phoneNumber, String otp) async {
    isVerifyOtp.value = true;
    var result = await AuthRepository.verifyOTPRepo(phoneNumber, otp);
    if (result == true) {
      isVerifyOtp.value = false;
      Get.offAllNamed(RoutesGetters.getDashboardRoute());
    } else {
      isVerifyOtp.value = false;
    }
  }

  logoutVm() async {
    final mainViewModel = Get.put(MainViewModel());
    mainViewModel.setMainLoader(true);
    var result = await AuthRepository.logoutRepo();
    await Singelton.clearAuth();
    if (result == true) {
      mainViewModel.setMainLoader(false);
      Get.offAllNamed(RoutesGetters.getLoginRoute());
    } else {
      mainViewModel.setMainLoader(false);
    }
  }

}
