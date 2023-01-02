import 'dart:ui';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';

class GlobalEquipments{

  static void SnackToastFailed(String title,String message){
    Get.snackbar(
        title,message,
        snackPosition: SnackPosition.TOP,
        colorText: AllColors.whiteColor,
        backgroundColor: AllColors.redColorDark
    );
  }

  static void SnackToastSuccess(String title,String message){
    Get.snackbar(
        title,message,
        snackPosition: SnackPosition.TOP,
        colorText: AllColors.whiteColor,
        backgroundColor: AllColors.greenColor
    );
  }

  static void MyLogs(String log){
    print(log);
  }
}