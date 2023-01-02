import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';
import 'LeftDrawer.dart';
import 'package:get/get.dart';

class GlobalMain{

  static Widget globalMainWidget(Widget myWidget,{BottomNavigationBar? bottomNavigationBar}){

    final mainViewModel = Get.put(MainViewModel());

    return SafeArea(
      child: Obx(()=>LoadingOverlayPro(
        isLoading: mainViewModel.isMainLoader.value,
        child: Scaffold(
            drawer: LeftDrawer(),
            body: myWidget,
            bottomNavigationBar: bottomNavigationBar
        ),
      )),
    );
  }
}