import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';

class GlobalRetails{

  static globalRetailsFilter(context) async {

    TextEditingController dateInput = TextEditingController();
    String? newValue;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    left: AllDimension.eight,
                    right: AllDimension.eight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Container(
                          margin: EdgeInsets.only(
                              top: AllDimension.sixteen),
                          child: Text("Filter Order",
                              style: TextStyle(
                                  fontSize: AllDimension.twentyFour,
                                  fontWeight: FontWeight.bold)),
                        ),

                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(AllDimension.eight),
                            margin: EdgeInsets.only(
                                top: AllDimension.sixteen
                            ),
                            decoration: BoxDecoration(
                              color: AllColors.greyLiColor,
                              borderRadius: BorderRadius.circular(
                                  AllDimension.oneHundred)
                            ),
                            child: Icon(Icons.close,color: AllColors.blackColor),
                          ),
                        )

                      ],
                    ),
                    Divider(),
                    SizedBox(height: AllDimension.eight),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Text("Retails",
                            style: TextStyle(
                                fontSize: AllDimension.twenty
                            )),
                        SizedBox(height: AllDimension.eight),
                        Container(
                          padding: EdgeInsets.only(
                              left:AllDimension.eight,
                              right: AllDimension.eight
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(
                                  AllDimension.four
                              )
                          ),
                          child: DropdownButton<String>(
                              hint: const Text("Select Retailer..."),
                              value: newValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 32,
                              underline: SizedBox(),
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  newValue = value;
                                  print(newValue);
                                });
                              },
                              items: <String>[
                                "Select Retailer",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ),

                      ],
                    ),

                    SizedBox(height: AllDimension.twentyFour),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Text("Order Status",
                            style: TextStyle(
                                fontSize: AllDimension.twenty
                            )),
                        SizedBox(height: AllDimension.eight),
                        Container(
                          padding: EdgeInsets.only(
                              left:AllDimension.eight,
                              right: AllDimension.eight
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(
                                  AllDimension.four
                              )
                          ),
                          child: DropdownButton<String>(
                              hint: const Text("Select Status..."),
                              value: newValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 32,
                              underline: SizedBox(),
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  newValue = value;
                                  print(newValue);
                                });
                              },
                              items: <String>[
                                "Select Retailer",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ),

                      ],
                    ),

                    SizedBox(height: AllDimension.twentyFour),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[


                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(AllDimension.sixteen),
                          decoration: BoxDecoration(
                            color: AllColors.blueColorLight,
                            borderRadius: BorderRadius.circular(AllDimension.four)
                          ),
                          child: Text("SUBMIT",
                          style: TextStyle(
                            fontSize: AllDimension.sixteen,
                            color: AllColors.whiteColor,)),
                        )

                      ],
                    ),

                    SizedBox(height: AllDimension.sixteen),


                  ],
                ),
              ),
            );
          });
        });
  }

}