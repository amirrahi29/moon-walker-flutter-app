import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';
import 'dart:math' as math;
import 'package:moon_walker/view_model/ProductViewModel.dart';

class GlobalToolbar{

  static Widget logoToolbar(BuildContext context){
    
    final productViewModel = Get.put(ProductViewModel());
    
    final dashboardViewModel = Get.put(DashboardViewModel());
    return Obx(() =>
        InkWell(
          onTap: (){
            //showPlacePicker(context);
            // Get.toNamed(RoutesGetters.getLocationPickRoute());
          },
          child: Container(
            margin: EdgeInsets.all(AllDimension.eight),
            child: Column(
              children: <Widget>[
                SizedBox(height: AllDimension.twelve),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Row(
                              children: <Widget>[

                                Image.asset(AllImages.destination,
                                    height: AllDimension.twentyFour),

                                SizedBox(width: AllDimension.eight),

                                Text(dashboardViewModel.locality.value == ""
                                    ?"Please wait...":
                                dashboardViewModel.locality.value,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AllDimension.twenty
                                  ),)

                              ],
                            ),

                            SizedBox(height: AllDimension.eight),

                            dashboardViewModel.address.value.length >35?
                            Text(dashboardViewModel.address.value == ""
                                ?"Please wait...":
                            "${dashboardViewModel.address.value.substring(0,35)}....",
                              style: TextStyle(
                                  color: AllColors.greyColor
                              ),)
                                :
                            Text(dashboardViewModel.address.value == ""
                                ?"Please wait...":
                                 dashboardViewModel.address.value,
                              style: TextStyle(
                                  color: AllColors.greyColor
                              ),)

                          ],
                        )
                    ),
                    InkWell(
                      onTap: (){
                        dashboardViewModel.scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        height: AllDimension.twentyEight,
                        width: AllDimension.twentyEight,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(AllDimension.oneHundred),
                            image: DecorationImage(
                                image: AssetImage(AllImages.menu))
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesGetters.getSearchProductScreenRoute());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: AllDimension.twentyFour),
                    child: TextField(
                      enabled: false,
                      cursorColor: AllColors.blackColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AllDimension.sixteen,
                            horizontal: AllDimension.sixteen
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AllDimension.eight),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: AllColors.lightGreyColor,
                        filled: true,
                        suffixIcon: Icon(Icons.search,
                            color: AllColors.greyColor
                        ),
                        hintText: 'Search for articles',
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ));
  }
  static Widget backToolbar(String title,BuildContext context){
    final dashboardViewModel = Get.put(DashboardViewModel());
    return Column(
      children: <Widget>[

        Container(
          margin: EdgeInsets.only(
              left: AllDimension.eight,
              right: AllDimension.eight,
              top: AllDimension.eight
          ),
          height: AllDimension.thirtyTwo,
          child: InkWell(
            onTap: (){
              Get.back();
            },
            child: Row(
              children: <Widget>[
                Image.asset(AllImages.backBtn),
                SizedBox(width: AllDimension.twelve,),
                Expanded(
                  child: Text(title,style: TextStyle(
                      fontSize:AllDimension.eighteen,
                      fontWeight: FontWeight.bold),),
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                    dashboardViewModel.scaffoldKey.currentState!.openDrawer();
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: AllDimension.thirtyTwo,
                    width: AllDimension.thirtyTwo,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(AllDimension.oneHundred),
                        image: DecorationImage(
                            image: AssetImage(AllImages.account))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider()

      ],
    );
  }
  static Widget backAndSearchToolbar(String title){

    final dashboardViewModel = Get.put(DashboardViewModel());

    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                  padding: EdgeInsets.only(
                    top: AllDimension.four,
                    bottom: AllDimension.four,
                  ),
                  child: Image.asset(AllImages.backBtn)
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: AllDimension.twelve),
                child: Text(title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: AllDimension.twentyFour,
                      color: AllColors.blackColor
                  ),),
              ),
            ),
            InkWell(
              onTap: (){
                // dashboardViewModel.setSearchEnable();
                Get.toNamed(RoutesGetters.getSearchProductScreenRoute());
              },
              child: Container(
                  padding: EdgeInsets.only(
                    top: AllDimension.four,
                    bottom: AllDimension.four,
                  ),
                  child: Image.asset(AllImages.search)
              ),
            ),
          ],
        ),
        Divider(),

      ],
    );
  }
  static Widget OtherToolbar(String title){
    return Column(
      children: <Widget>[

        InkWell(
            onTap: () {
              Get.back();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                      top: AllDimension.sixteen,
                      bottom: AllDimension.sixteen,
                    ),
                    child: Image.asset(AllImages.backBtn)
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: AllDimension.twelve),
                    child: Text(title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AllColors.blackColor
                    ),),
                  ),
                )
              ],
            )
        ),
        Divider()

      ],
    );
  }
  static Widget OTPToolbarBlock(){
    return InkWell(
      onTap: (){
        Get.back();
      },
      child: Row(
        children: <Widget>[

          Transform.rotate(
            angle: 180 * math.pi / 180,
            child: IconButton(
              icon: Icon(
                Icons.arrow_right_alt_outlined,
                color: AllColors.blackColor,
              ),
              onPressed: null,
            ),
          ),

          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Text("OTP Verification",
                  style: TextStyle(
                      fontSize: AllDimension.twenty,
                      color: AllColors.blackColor,
                    fontWeight: FontWeight.bold
                  ),)
            ),
          )

        ],
      ),
    );
  }
  //
  // static showPlacePicker(BuildContext context) async {
  //
  //   final dashboardViewModel = Get.put(DashboardViewModel());
  //
  //   LocationResult? result = await Get.to(PlacePicker(Config.googleMapApiKey));
  //
  //   // Handle the result in your way
  //   print("address: ${result!.formattedAddress}");
  //   print("city: ${result.subLocalityLevel1!.name}");
  //
  //   if(result.formattedAddress != null && result.subLocalityLevel1!.name != null)
  //     {
  //       dashboardViewModel.setAddressLocality(result.formattedAddress.toString(),
  //           result.subLocalityLevel1!.name.toString());
  //     }
  // }

}