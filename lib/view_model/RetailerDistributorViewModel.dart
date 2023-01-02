import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moon_walker/model/RetailerDistributorModel.dart';
import 'package:moon_walker/repository/RetailerDistributor.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class RetailerDistributorViewModel extends GetxController{

  var allDistributors = <RetailerDistributorModel>[].obs;
  var allRetailers = <RetailerDistributorModel>[].obs;
  var allDistributorsSearch = <RetailerDistributorModel>[].obs;
  var allRetailersSearch = <RetailerDistributorModel>[].obs;

  final mainViewHolder = Get.put(MainViewModel());

  //
  var isDistributorAvailable = 0.obs;
  var isRetailerAvailable = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllDistributorsVm();
    getAllRetailersVm();
  }

  getAllDistributorsVm() async{
    isDistributorAvailable.value = 0;
    allDistributors.clear();
    allDistributorsSearch.clear();
    var result = await RetailerDistributorRepo.getDistributorsRepo();
    if(result.isNotEmpty){
      isDistributorAvailable.value = 1;
      allDistributors.value = result;
      allDistributorsSearch.addAll(allDistributors);
    }
    else if(result.isEmpty){
      isDistributorAvailable.value = 2;
    }
    else{
      isDistributorAvailable.value = 0;
    }
  }

  getAllRetailersVm() async{
    isRetailerAvailable.value = 0;
    allRetailers.clear();
    allRetailersSearch.clear();
    var result = await RetailerDistributorRepo.getRetailerRepo();
    if(result.isNotEmpty){
      isRetailerAvailable.value = 1;
      allRetailers.value = result;
      allRetailersSearch.addAll(allRetailers);
    }
    else if(result.isEmpty){
      isRetailerAvailable.value = 2;
    }
    else{
      isRetailerAvailable.value = 0;
    }
  }

  searchRetailOrders(String text)async{
    allRetailersSearch.clear();
    if(text.isEmpty){
      allRetailers.forEach((element) {
        allRetailersSearch.add(element);
      });
    }
    else{
      allRetailers.forEach((element) {
        if(element.name!.toLowerCase().contains(text)
            || element.email!.toLowerCase().contains(text)
            || element.phone!.toLowerCase().contains(text))
        {
          allRetailersSearch.add(element);
        }
      });
    }
  }

  searchDistributorsOrders(String text)async{
    allDistributorsSearch.clear();
    if(text.isEmpty){
      allDistributors.forEach((element) {
        allDistributorsSearch.add(element);
      });
    }
    else{
      allDistributors.forEach((element) {
        if(element.name!.toLowerCase().contains(text)
            || element.email!.toLowerCase().contains(text)
            || element.phone!.toLowerCase().contains(text))
        {
          allDistributorsSearch.add(element);
        }
      });
    }
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    getAllDistributorsVm();
    getAllRetailersVm();
    return null;
  }

}