import 'package:get/get.dart';

class MainViewModel extends GetxController{

  var isMainLoader = false.obs;

  setMainLoader(bool isLoader){
    isMainLoader.value = isLoader;
  }

}