import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view_model/LocationAddresViewModel.dart';
import 'package:moon_walker/view_model/SplashViewModel.dart';

class GoogleAddressDetailsPage extends StatefulWidget {
  const GoogleAddressDetailsPage({Key? key}) : super(key: key);

  @override
  State<GoogleAddressDetailsPage> createState() => _GoogleAddressDetailsPageState();
}

class _GoogleAddressDetailsPageState extends State<GoogleAddressDetailsPage> {

  final locationAddressViewModel = Get.put(LocationAddresViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(()=>Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[

                        Container(
                          height: AllDimension.oneHundred,
                          width: AllDimension.oneHundred,
                          decoration: BoxDecoration(
                              color: AllColors.greyLiColor,
                              borderRadius: BorderRadius.circular(
                                  AllDimension.oneHundred)
                          ),
                        ),

                        Positioned(
                          left:AllDimension.thirtyThree,
                          top: AllDimension.thirtyTwo,
                          child: Container(
                            height: AllDimension.thirtysix,
                            width: AllDimension.thirtysix,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AllColors.customBlueColor,
                                borderRadius: BorderRadius.circular(
                                    AllDimension.oneHundred)
                            ),
                          ),
                        ),

                        Positioned(
                            right: 38,
                            bottom: 50,
                            child: Image.asset(AllImages.destination,
                                height: AllDimension.oneThirty)
                        )

                      ],
                    ),

                    SizedBox(height: AllDimension.twelve,),

                    Text("MY LOCATION",
                        style: TextStyle(
                            color: AllColors.greyColor,
                            fontSize: AllDimension.sixteen)
                    ),

                    SizedBox(height: AllDimension.twelve,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Image.asset(AllImages.marker,
                            height: AllDimension.sixtyFour),

                        Text(locationAddressViewModel.locality.value == ""?"Please wait...":locationAddressViewModel.locality.value,
                            style: TextStyle(fontSize: AllDimension.twentyEight,
                                fontWeight: FontWeight.bold,
                                color: AllColors.customBlueColor)),
                      ],
                    ),

                    SizedBox(height: AllDimension.sixteen,),

                    Text(locationAddressViewModel.address.value == ""?"Please wait...":locationAddressViewModel.address.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AllDimension.twenty,
                        )
                    ),

                  ],
                )
            ),
          )),
        )
    );
  }
}

