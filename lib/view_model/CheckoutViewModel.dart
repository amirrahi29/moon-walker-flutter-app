import 'package:get/get.dart';

class CheckoutViewModel extends GetxController{

  var isVisibleProducts = false.obs;

  void toggleOrderSummary(bool isBool){
    isVisibleProducts.value = isBool;
  }

}