import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/model/CategoryModel.dart';
import 'package:moon_walker/model/CollectionModel.dart';
import 'package:moon_walker/model/SlidersModel.dart';
import 'package:moon_walker/repository/DashboardRepo.dart';
import 'package:moon_walker/repository/ProductRepository.dart';

import 'MainViewModel.dart';

class DashboardViewModel extends GetxController{

  final mainViewModel = Get.put(MainViewModel());
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var address = "".obs;
  var locality = "".obs;
  var isCategorySelected = true.obs;
  var categoryList = <CategoryModel>[].obs;
  var collectionList = <CollectionModel>[].obs;
  var searchCollectionList = <CollectionModel>[].obs;
  var sliderList = <SliderModel>[].obs;
  var categoryId = 1.obs;
  var isEnableSearch = false.obs;
  var orderSumTotal = "".obs;
  var isCollectionAvailable = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _getCurrentLocation();
    getDashboardCategories();
    getOrderSumTotal();
    getDashboardFashionCollections(1);
    getDashboardFashionCollections(1);
    super.onInit();
  }

  void setSearchEnable(){
    if(!isEnableSearch.value){
      isEnableSearch.value = true;
    }else{
      isEnableSearch.value = false;
    }
  }

  void openDrawerToggle(){
    scaffoldKey.currentState!.openDrawer();
    update();
  }

  void closeDrawerToggle(){
    scaffoldKey.currentState!.closeDrawer();
    update();
  }

  void setAddressLocality(String myAddress, String myLocality){
    address.value = myAddress;
    locality.value = myLocality;
  }

  setCategoryId(int id) async {
    categoryId.value = id;
    getDashboardFashionCollections(id);
  }

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    // calculateDistance();
    GlobalEquipments.MyLogs("Mylatitude: ${position.latitude}, placemarks: ${placemarks.first.locality}");
    if(placemarks.first.locality != ""){
      getDashboardSliders("${position.latitude}","${position.longitude}");
      address.value = "${placemarks.first.locality.toString()},"
          " ${placemarks.first.street.toString()} ${placemarks.first.country.toString()}, ${placemarks.first.postalCode.toString()}";
      locality.value = placemarks.first.locality.toString();
    }
    return await Geolocator.getCurrentPosition();
  }

  setCategorySelected(bool isCat){
    isCategorySelected.value = isCat;
  }

  getDashboardCategories() async {
    categoryList.clear();
    var result = await DashboardRepo.getCategories();
    if(result != null){
     categoryList.value = result;
    }
  }

  getOrderSumTotal() async {
    orderSumTotal.value = "0";
    var result = await DashboardRepo.getUsers();
    if(result != null){
      orderSumTotal.value = result['orders_sum_total'].toString();
    }
  }

  getDashboardFashionCollections(int id) async {
    isCollectionAvailable.value = 0;
    searchCollectionList.clear();
    collectionList.clear();
    categoryId.value = id;
    var result = await DashboardRepo.getFashionCollections(categoryId.value);
    if(result.isNotEmpty){
      collectionList.value = result;
      searchCollectionList.addAll(collectionList);
      isCollectionAvailable.value = 1;
    }else if(result.isEmpty){
      isCollectionAvailable.value = 2;
    } else{
      isCollectionAvailable.value = 0;
    }
  }

  getDashboardSliders(latitude,longitude)async{
    sliderList.clear();
    var result = await DashboardRepo.getDashboardSliders(latitude, longitude);
    if(result != null){
      sliderList.value = result;
    }
  }

  searchCollection(String text)async{
    searchCollectionList.clear();
    if(text.isEmpty){
      collectionList.forEach((element) {
        searchCollectionList.add(element);
      });
    }
    else{
      collectionList.forEach((element) {
        if(element.name!.toLowerCase().contains(text))
        {
          searchCollectionList.add(element);
        }
      });
    }
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    _getCurrentLocation();
    getDashboardFashionCollections(1);
    getDashboardCategories();
    return null;
  }

  Future<Null> refreshCatList() async {
    collectionList.clear();
    searchCollectionList.clear();
    await Future.delayed(Duration(seconds: 2));
    getDashboardFashionCollections(categoryId.value);
    return null;
  }
}