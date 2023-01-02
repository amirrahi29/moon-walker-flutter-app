import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/HomeListItems.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/AuthViewModel.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {

  final authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardViewModel>(builder: (controller) {
      return LoadingOverlayPro(
        isLoading: authViewModel.isLogoutLoader.value,
        child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Container(
              height: AllDimension.infinity,
              width: AllDimension.infinity,
              color: AllColors.lightCyanColor!,
              padding: EdgeInsets.all(AllDimension.eight),
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          controller.scaffoldKey.currentState!.closeDrawer();
                        },
                        child: Container(
                          width: AllDimension.thirtyTwo,
                          padding: EdgeInsets.all(AllDimension.four),
                          margin: EdgeInsets.all(AllDimension.eight),
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              color: AllColors.whiteColor,
                              borderRadius:
                                  BorderRadius.circular(AllDimension.oneHundred)),
                          child: Icon(Icons.close, color: AllColors.blackColor),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Get.toNamed(RoutesGetters.getProfileRoute());
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(AllDimension.twelve),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "MANOJ CHANDOLA",
                                          style: TextStyle(
                                              color: AllColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AllDimension.twelve),
                                        ),
                                      ),
                                      Container(
                                        child: Text("salesman@gmail.com",
                                          style: TextStyle(
                                            color: AllColors.greyColor,
                                            fontSize: AllDimension.twelve,),),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: AllDimension.thirtyTwo,
                                  width: AllDimension.thirtyTwo,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(AllDimension.oneHundred),
                                      image: DecorationImage(
                                          image: AssetImage(AllImages.account))
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: AllDimension.sixteen,),

                      for(int i = 0; i<HomeListItems.homeDrawerList.length; i++)
                      InkWell(
                        onTap: (){
                          controller.scaffoldKey.currentState!.closeDrawer();
                          if(i == 0){
                            Get.toNamed(RoutesGetters.getRetailOrderRoute());
                          }else if(i == 1){
                            Get.toNamed(RoutesGetters.getRetailRoute());
                          }else if(i == 2){
                            Get.toNamed(RoutesGetters.getDistributorRoute());
                          }else if(i == 3){
                            Get.toNamed(RoutesGetters.getHelpCenterRoute());
                          }else if(i == 4){
                            Get.toNamed(RoutesGetters.getDashboardRoute());
                          } else if(i == 5){
                            // Get.toNamed(RoutesGetters.getAddressRoute());
                          } else if(i == 6){
                            Get.toNamed(RoutesGetters.getAboutRoute());
                          }else if(i == 7){
                            Get.toNamed(RoutesGetters.getTermsRoute());
                          }else if(i == 8){
                            controller.scaffoldKey.currentState!.closeDrawer();
                            authViewModel.logoutVm();
                          }
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(AllDimension.twelve),
                            child: Row(
                              children: <Widget>[

                                Container(
                                  height: AllDimension.thirtyTwo,
                                  width: AllDimension.thirtyTwo,
                                  child: HomeListItems.homeDrawerList[i].icon,
                                ),
                                SizedBox(width: AllDimension.eight,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          HomeListItems.homeDrawerList[i].title,
                                          style: TextStyle(
                                              fontSize: AllDimension.twelve),
                                        ),
                                      ),
                                      Container(
                                        child: Text(HomeListItems.homeDrawerList[i].description,
                                          style: TextStyle(
                                            color: AllColors.greyColor,
                                            fontSize: AllDimension.twelve,),),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),
            )),
      );
    });
  }
}
