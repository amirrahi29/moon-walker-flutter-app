import 'package:get/get.dart';

class ProductDetailsViewModel extends GetxController{

  var selectedColor = 200.obs;
  var selectedSize = 200.obs;

  var colorCode = "#000000".obs;

  setColorCode(String code){
    colorCode.value = code;
  }

  onSelectColor(int colorId){
    selectedColor.value = colorId;
  }
  onSizeSelected(int sizeId){
    selectedColor.value = sizeId;
  }

}