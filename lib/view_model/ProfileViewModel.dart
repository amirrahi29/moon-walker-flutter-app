import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moon_walker/model/UserModel.dart';
import 'package:moon_walker/repository/ProfileRepository.dart';

class ProfileViewModel extends GetxController{

  var id = "".obs;
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var avatar = "".obs;
  var orderCount = "".obs;
  var newOrderCount = "".obs;
  var isUpdateLoader = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async{
    isUpdateLoader.value = true;
    var result = await ProfileRepository.getProfile();
    if (result != false) {
      isUpdateLoader.value = false;

      //model
      UserModel userModel = UserModel();
      userModel.id = result['id'].toString();
      userModel.name = result['name'].toString();
      userModel.email = result['email'].toString();
      userModel.phone = result['phone'].toString();
      userModel.avatar = result['avatar'].toString();
      userModel.orders_count = result['orders_count'].toString();
      userModel.new_orders_count = result['new_orders_count'].toString();

      id.value = userModel.id!;
      name.value = userModel.name!;
      email.value = userModel.email!;
      phone.value = userModel.phone!;
      avatar.value = userModel.avatar!;

    } else {
      isUpdateLoader.value = false;
    }
  }

  Future<void> updateProfile(String name, String email, String phone,BuildContext context) async{
    isUpdateLoader.value = true;
    var result = await ProfileRepository.updateProfile(name, email, phone);
    if (result == true) {
      isUpdateLoader.value = false;
      Navigator.pop(context);
    } else {
      isUpdateLoader.value = false;
    }
  }

}