import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moon_walker/repository/QueryRepository.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class QueryViewModel extends GetxController{

  final mainViewModel = Get.put(MainViewModel());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ssaveQuery(String query, BuildContext context)async{
    mainViewModel.isMainLoader(true);
    var result = await QueryRepository.submitQueryForm(query);
    if(result == true){
      mainViewModel.isMainLoader(false);
      Navigator.pop(context);
    }else{
      mainViewModel.isMainLoader(false);
    }
  }

}