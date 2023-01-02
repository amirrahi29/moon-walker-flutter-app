import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/BottomTabItems.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/LeftDrawer.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  //bottom tab items class
  final _bottomTabItems = BottomTabItems();
  final dashboardViewModel = Get.put(DashboardViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DashboardViewModel>(
        builder: (controller){
          return Scaffold(
            drawer: LeftDrawer(),
            key: controller.scaffoldKey,
            body: _bottomTabItems.allBottomPages[_bottomTabItems.visit],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _bottomTabItems.visit,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AllColors.redColorDark,
                items: _bottomTabItems.allTabs(_bottomTabItems.visit,_bottomTabItems.selectedTab),
                  onTap: (int index) => setState(() {
                    if(index == 2){
                      _bottomTabItems.selectedTab = 2;
                      Get.toNamed(RoutesGetters.getScanRoute());
                    }
                    else if(index == 3){
                      _bottomTabItems.selectedTab = 3;
                      Get.toNamed(RoutesGetters.getWishlistRoute());
                    }
                    else if(index == 4){
                      _bottomTabItems.selectedTab = 4;
                      Get.toNamed(RoutesGetters.getCartRoute());
                    }
                    else{
                      _bottomTabItems.selectedTab = index;
                      _bottomTabItems.visit = index;
                    }
                  }),
              )
          );
        },
      ),
    );
  }
}