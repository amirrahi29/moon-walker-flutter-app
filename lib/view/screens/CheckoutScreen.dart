import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/CheckoutViewModel.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? newValue;
  bool isVisibleProducts = false;
  final checkoutViewModel = Get.put(CheckoutViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(SingleChildScrollView(
      child: Obx(() => Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  GlobalToolbar.backToolbar("Checkout", context),
                  Container(
                    margin: EdgeInsets.all(AllDimension.twelve),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: AllDimension.twentyFour),
                        Text("Retails",
                            style: TextStyle(fontSize: AllDimension.twenty)),
                        SizedBox(height: AllDimension.eight),
                        Container(
                          padding: EdgeInsets.only(
                              left: AllDimension.eight,
                              right: AllDimension.eight),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(AllDimension.four)),
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
                  ),
                  Container(
                    margin: EdgeInsets.all(AllDimension.twelve),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Distributors",
                            style: TextStyle(fontSize: AllDimension.twenty)),
                        SizedBox(height: AllDimension.eight),
                        Container(
                          padding: EdgeInsets.only(
                              left: AllDimension.eight,
                              right: AllDimension.eight),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(AllDimension.four)),
                          child: DropdownButton<String>(
                              hint: const Text("Select Distributors..."),
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
                                "Select Distributor",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ),
                        SizedBox(height: AllDimension.twentyFour),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Order Summary",
                                    style: TextStyle(
                                        fontSize: AllDimension.twenty)),
                                SizedBox(width: AllDimension.eight),
                                Text("(1 Style - 6 Items)",
                                    style: TextStyle(
                                        fontSize: AllDimension.fourteen,
                                        color: AllColors.redColorDark)),
                              ],
                            ),
                            checkoutViewModel.isVisibleProducts.value
                                ? InkWell(
                                    onTap: () {
                                      checkoutViewModel
                                          .toggleOrderSummary(false);
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: AllDimension.twentyFour,
                                      color: AllColors.blackColor,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      checkoutViewModel
                                          .toggleOrderSummary(true);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: AllDimension.twentyFour,
                                      color: AllColors.blackColor,
                                    ),
                                  )
                          ],
                        ),
                        SizedBox(height: AllDimension.twenty),
                        Visibility(
                          visible: checkoutViewModel.isVisibleProducts.value,
                          child: Column(
                            children: <Widget>[
                              for (int i = 0; i < 2; i++)
                                Container(
                                    margin: EdgeInsets.only(
                                        bottom: AllDimension.eight),
                                    padding: EdgeInsets.all(AllDimension.eight),
                                    decoration: BoxDecoration(
                                        color: AllColors.lightGreyColor,
                                        borderRadius: BorderRadius.circular(
                                            AllDimension.four)),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: AllDimension.oneTwenty,
                                              width: AllDimension.eightyFour,
                                              child: Image.asset(
                                                AllImages.shirt,
                                                fit: BoxFit.cover,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AllDimension.eight)),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  margin: EdgeInsets.all(
                                                      AllDimension.eight),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            width: AllDimension
                                                                .eight,
                                                          ),
                                                          Text(
                                                            "1002-RN",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .fourteen,
                                                                color: AllColors
                                                                    .blueColorLight,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  AllDimension
                                                                      .eight),
                                                          Text(
                                                            "(13 Items)",
                                                            style: TextStyle(
                                                                color: AllColors
                                                                    .redColor,
                                                                fontSize:
                                                                    AllDimension
                                                                        .fourteen),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: AllDimension
                                                              .four),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            width: AllDimension
                                                                .eight,
                                                          ),
                                                          Text(
                                                            "Sub Total",
                                                            style: TextStyle(
                                                              fontSize:
                                                                  AllDimension
                                                                      .fourteen,
                                                              color: AllColors
                                                                  .greyColor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  AllDimension
                                                                      .eight),
                                                          Text(
                                                            "₹ 2094",
                                                            style: TextStyle(
                                                                color: AllColors
                                                                    .blackColor,
                                                                fontSize:
                                                                    AllDimension
                                                                        .fourteen,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: AllDimension
                                                              .four),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            width: AllDimension
                                                                .eight,
                                                          ),
                                                          Text(
                                                            "Color",
                                                            style: TextStyle(
                                                              fontSize:
                                                                  AllDimension
                                                                      .fourteen,
                                                              color: AllColors
                                                                  .greyColor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  AllDimension
                                                                      .eight),
                                                          Text(
                                                            "PEACH",
                                                            style: TextStyle(
                                                                color: AllColors
                                                                    .blackColor,
                                                                fontSize:
                                                                    AllDimension
                                                                        .fourteen,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: AllDimension.eight),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "₹ 649.00",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .twelve),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AllDimension
                                                                        .eight),
                                                            decoration: BoxDecoration(
                                                                color: AllColors
                                                                    .blueColorLight,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AllDimension
                                                                            .two)),
                                                            child: Text(
                                                              "S",
                                                              style: TextStyle(
                                                                  color: AllColors
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      AllDimension
                                                                          .twelve),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            AllDimension.four),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      height:
                                                          AllDimension.fifty,
                                                      decoration: BoxDecoration(
                                                          color: AllColors
                                                              .greyColor),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width:
                                                                    AllDimension
                                                                        .infinity,
                                                                color: AllColors
                                                                    .whiteColor,
                                                                child:
                                                                    Text("1"),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "₹ 649.00",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .twelve),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AllDimension
                                                                        .eight),
                                                            decoration: BoxDecoration(
                                                                color: AllColors
                                                                    .blueColorLight,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AllDimension
                                                                            .two)),
                                                            child: Text(
                                                              "M",
                                                              style: TextStyle(
                                                                  color: AllColors
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      AllDimension
                                                                          .twelve),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            AllDimension.four),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      height:
                                                          AllDimension.fifty,
                                                      decoration: BoxDecoration(
                                                          color: AllColors
                                                              .greyColor),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width:
                                                                    AllDimension
                                                                        .infinity,
                                                                color: AllColors
                                                                    .whiteColor,
                                                                child:
                                                                    Text("1"),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "₹ 649.00",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .twelve),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AllDimension
                                                                        .eight),
                                                            decoration: BoxDecoration(
                                                                color: AllColors
                                                                    .blueColorLight,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AllDimension
                                                                            .two)),
                                                            child: Text(
                                                              "L",
                                                              style: TextStyle(
                                                                  color: AllColors
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      AllDimension
                                                                          .twelve),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            AllDimension.four),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      height:
                                                          AllDimension.fifty,
                                                      decoration: BoxDecoration(
                                                          color: AllColors
                                                              .greyColor),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width:
                                                                    AllDimension
                                                                        .infinity,
                                                                color: AllColors
                                                                    .whiteColor,
                                                                child:
                                                                    Text("1"),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "₹ 649.00",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .twelve),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AllDimension
                                                                        .eight),
                                                            decoration: BoxDecoration(
                                                                color: AllColors
                                                                    .blueColorLight,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AllDimension
                                                                            .two)),
                                                            child: Text(
                                                              "XL",
                                                              style: TextStyle(
                                                                  color: AllColors
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      AllDimension
                                                                          .twelve),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            AllDimension.four),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      height:
                                                          AllDimension.fifty,
                                                      decoration: BoxDecoration(
                                                          color: AllColors
                                                              .greyColor),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width:
                                                                    AllDimension
                                                                        .infinity,
                                                                color: AllColors
                                                                    .whiteColor,
                                                                child:
                                                                    Text("1"),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "₹ 649.00",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .twelve),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AllDimension
                                                                        .eight),
                                                            decoration: BoxDecoration(
                                                                color: AllColors
                                                                    .blueColorLight,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AllDimension
                                                                            .two)),
                                                            child: Text(
                                                              "2XL",
                                                              style: TextStyle(
                                                                  color: AllColors
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      AllDimension
                                                                          .twelve),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            AllDimension.four),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: AllDimension
                                                              .eight),
                                                      height:
                                                          AllDimension.fifty,
                                                      decoration: BoxDecoration(
                                                          color: AllColors
                                                              .greyColor),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width:
                                                                    AllDimension
                                                                        .infinity,
                                                                color: AllColors
                                                                    .whiteColor,
                                                                child:
                                                                    Text("1"),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: AllDimension.sixteen),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Sub Total"),
                                            Text("₹ 8437.00"),
                                          ],
                                        ),
                                        SizedBox(height: AllDimension.eight),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Tax Amount"),
                                            Text("₹ 104.7"),
                                          ],
                                        ),
                                        SizedBox(height: AllDimension.eight),
                                        Divider(),
                                        SizedBox(height: AllDimension.eight),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Net Payable"),
                                            Text("₹ 2199"),
                                          ],
                                        ),
                                      ],
                                    )),
                            ],
                          ),
                        ),
                        SizedBox(height: AllDimension.eight),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          )),
    ));
  }
}
