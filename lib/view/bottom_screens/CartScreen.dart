import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/model/Distributor.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view/screens/RetailerDistributorsAddresses.dart';
import 'package:moon_walker/view/screens/SelectRetailerDistributor.dart';
import 'package:moon_walker/view_model/AddressViewModel.dart';
import 'package:moon_walker/view_model/CartViewModel.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartViewModel = Get.put(CartViewModel());
  final mainViewModel = Get.put(MainViewModel());
  final addressViewModel = Get.put(AddressViewModel());
  String? retailerDropdownValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartViewModel.getAllCartItems();
    cartViewModel.getCartBillDetails();
    cartViewModel.getCustomers("retailers");
    cartViewModel.getRetailerAddresses();
    cartViewModel.getDistributorAddresses();
    cartViewModel.getRetailers();
    cartViewModel.getDistributors();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
      Obx(() => Stack(
            children: <Widget>[
              GlobalToolbar.backToolbar("Cart", context),
              Container(
                color: AllColors.lightGreyColor,
                child: Column(
                  children: <Widget>[
                    GlobalToolbar.backToolbar("Cart", context),
                    if (cartViewModel.isCartAvailable.value == 1)
                      Expanded(
                          child: Obx(() => LoadingOverlayPro(
                                isLoading: mainViewModel.isMainLoader.value,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: <Widget>[
                                    if (cartViewModel
                                        .cartProductList.isNotEmpty)
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: AllDimension.oneEighty),
                                        child: ListView.builder(
                                            itemCount: cartViewModel
                                                .cartProductList.length,
                                            itemBuilder: (context, index) {
                                              return Stack(
                                                clipBehavior: Clip.none,
                                                children: <Widget>[
                                                  Container(
                                                      margin: EdgeInsets.all(
                                                          AllDimension.four),
                                                      child: Card(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  AllDimension
                                                                      .eight),
                                                          child: Row(
                                                            children: <Widget>[
                                                              cartViewModel
                                                                          .cartProductList[
                                                                              index]
                                                                          .image !=
                                                                      ""
                                                                  ? Container(
                                                                      width: AllDimension
                                                                          .oneHundred,
                                                                      height: AllDimension
                                                                          .oneFifty,
                                                                      child: Image
                                                                          .network(
                                                                        cartViewModel
                                                                            .cartProductList[index]
                                                                            .image!,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: AllDimension
                                                                          .oneHundred,
                                                                      height: AllDimension
                                                                          .oneFifty,
                                                                      child: Image
                                                                          .asset(
                                                                        AllImages
                                                                            .shirt,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .eight),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: <Widget>[
                                                                                Row(
                                                                                  children: <Widget>[
                                                                                    Text("Style", style: TextStyle(fontSize: AllDimension.eighteen, color: AllColors.greyColor)),
                                                                                    SizedBox(width: AllDimension.four),
                                                                                    Text("${cartViewModel.cartProductList[index].articleNo ?? ""}", style: TextStyle(fontSize: AllDimension.eighteen, color: AllColors.blackColor, fontWeight: FontWeight.bold))
                                                                                  ],
                                                                                ),
                                                                                SizedBox(height: AllDimension.eight),
                                                                                if (cartViewModel.cartProductList[index].colors!.isNotEmpty)
                                                                                  SizedBox(
                                                                                    height: AllDimension.eightyFour,
                                                                                    child: SingleChildScrollView(
                                                                                      child: Column(
                                                                                        children: <Widget>[
                                                                                          for (int j = 0; j < cartViewModel.cartProductList[index].colors!.length; j++)
                                                                                            Row(
                                                                                              children: <Widget>[
                                                                                                Container(
                                                                                                  margin: EdgeInsets.all(AllDimension.two),
                                                                                                  height: AllDimension.twentyFour,
                                                                                                  width: AllDimension.twentyFour,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: HexColor(cartViewModel.cartProductList[index].colors![j].color_code!),
                                                                                                    borderRadius: BorderRadius.circular(AllDimension.oneHundred),
                                                                                                    border: Border.all(color: AllColors.greyColor!, width: AllDimension.two // border color
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(width: AllDimension.four),
                                                                                                Expanded(
                                                                                                  child: Text("${cartViewModel.cartProductList[index].colors![j].color}", style: TextStyle(fontSize: AllDimension.twelve, color: AllColors.blackColor)),
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: <Widget>[
                                                                                Text("₹${cartViewModel.cartProductList[index].retailer_subtotal}", style: TextStyle(fontSize: AllDimension.eighteen, color: AllColors.blackColor, fontWeight: FontWeight.bold)),
                                                                                Text("${cartViewModel.cartProductList[index].totalQuantity} pieces", style: TextStyle(fontSize: AllDimension.eighteen, color: AllColors.greyColor))
                                                                              ],
                                                                            )),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            AllDimension.eight),
                                                                    if (cartViewModel
                                                                        .cartProductList[
                                                                            index]
                                                                        .size!
                                                                        .isNotEmpty)
                                                                      SizedBox(
                                                                        height:
                                                                            AllDimension.fourty,
                                                                        child: ListView.builder(
                                                                            itemCount: cartViewModel.cartProductList[index].size!.length,
                                                                            scrollDirection: Axis.horizontal,
                                                                            itemBuilder: (context, index1) {
                                                                              return Container(
                                                                                alignment: Alignment.center,
                                                                                padding: EdgeInsets.only(
                                                                                  left: AllDimension.sixteen,
                                                                                  right: AllDimension.sixteen,
                                                                                  top: AllDimension.six,
                                                                                  bottom: AllDimension.six,
                                                                                ),
                                                                                margin: EdgeInsets.all(AllDimension.two),
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: AllColors.greyColor!, // border color
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(AllDimension.eight),
                                                                                ),
                                                                                child: Row(
                                                                                  children: <Widget>[
                                                                                    Text("${cartViewModel.cartProductList[index].size![index1].size} |", style: TextStyle(color: AllColors.blackColor, fontSize: AllDimension.eighteen, fontWeight: FontWeight.bold)),
                                                                                    SizedBox(width: AllDimension.four),
                                                                                    Text("${cartViewModel.cartProductList[index].size![index1].total_quantity}", style: TextStyle(color: AllColors.blackColor, fontSize: AllDimension.eighteen))
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            }),
                                                                      )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                  Positioned(
                                                      right:
                                                          AllDimension.twelve,
                                                      top: AllDimension.twelve,
                                                      child: InkWell(
                                                          onTap: () {
                                                            cartViewModel
                                                                .deleteFromCart(
                                                                    cartViewModel
                                                                        .cartProductList[
                                                                            index]
                                                                        .id!,
                                                                    context);
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            color: AllColors
                                                                .redColorDark,
                                                          )))
                                                ],
                                              );
                                            }),
                                      ),
                                    Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: AllColors.lightGreyColor,
                                          padding: EdgeInsets.all(
                                              AllDimension.eight),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  if (cartViewModel
                                                          .isBillDetails
                                                          .value ==
                                                      true) {
                                                    cartViewModel
                                                        .toggleBillDetails(
                                                            false);
                                                  } else if (cartViewModel
                                                          .isBillDetails
                                                          .value ==
                                                      false) {
                                                    cartViewModel
                                                        .toggleBillDetails(
                                                            true);
                                                  }
                                                },
                                                child: Row(
                                                  children: <Widget>[
                                                    Text("Bill Details",
                                                        style: TextStyle(
                                                            fontSize:
                                                                AllDimension
                                                                    .eighteen,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    cartViewModel.isBillDetails
                                                                .value ==
                                                            false
                                                        ? Icon(Icons
                                                            .keyboard_arrow_down_outlined)
                                                        : Icon(Icons
                                                            .keyboard_arrow_up_outlined)
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: cartViewModel
                                                    .isBillDetails.value,
                                                child: Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                        height: AllDimension
                                                            .sixteen),
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          AllDimension.sixteen),
                                                      decoration: BoxDecoration(
                                                          color: AllColors
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  AllDimension
                                                                      .eight)),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  const Text(
                                                                      "Total MRP"),
                                                                  SizedBox(
                                                                      width: AllDimension
                                                                          .six),
                                                                  Text(
                                                                      "(182 Article | 3490 Pieces)",
                                                                      style: TextStyle(
                                                                          color: AllColors
                                                                              .greyColor,
                                                                          fontSize:
                                                                              AllDimension.twelve)),
                                                                ],
                                                              ),
                                                              Text(
                                                                  "₹ ${cartViewModel.TotalMRP}"),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AllDimension
                                                                      .six),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              const Text(
                                                                  "Discount"),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .six),
                                                              Text(
                                                                  "${cartViewModel.retailer_discount}",
                                                                  style: TextStyle(
                                                                      color: AllColors
                                                                          .greenColor)),
                                                            ],
                                                          ),
                                                          const Divider(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text("Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AllDimension
                                                                              .sixteen,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .six),
                                                              Text(
                                                                  "${cartViewModel.Total}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AllDimension
                                                                              .sixteen)),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AllDimension
                                                                      .six),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                  "Retailer Discount",
                                                                  style:
                                                                      TextStyle()),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .six),
                                                              Text(
                                                                  "₹ ${cartViewModel.retailer_discount}",
                                                                  style:
                                                                      TextStyle()),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AllDimension
                                                                      .six),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                  "Distributor Discount",
                                                                  style:
                                                                      TextStyle()),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .six),
                                                              Text(
                                                                  "₹ ${cartViewModel.distributor_discount}",
                                                                  style: TextStyle(
                                                                      color: AllColors
                                                                          .redColorDark)),
                                                            ],
                                                          ),
                                                          Divider(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                  "Retailer Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AllDimension
                                                                              .sixteen,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .six),
                                                              Text(
                                                                  "₹ ${cartViewModel.retailer_subtotal}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AllDimension
                                                                              .sixteen)),
                                                            ],
                                                          ),
                                                          Divider(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                  "Distributor Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AllDimension
                                                                              .sixteen,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                  width:
                                                                      AllDimension
                                                                          .six),
                                                              Text(
                                                                  "₹ ${cartViewModel.distributor_subtotal}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AllDimension
                                                                              .sixteen)),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      AllDimension.twentyFour),
                                              InkWell(
                                                onTap: () {
                                                  if (cartViewModel
                                                          .isDeliveryDetails
                                                          .value ==
                                                      true) {
                                                    cartViewModel
                                                        .toggleAddressDetails(
                                                            false);
                                                  } else if (cartViewModel
                                                          .isDeliveryDetails
                                                          .value ==
                                                      false) {
                                                    cartViewModel
                                                        .toggleAddressDetails(
                                                            true);
                                                  }
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Delivery Address",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AllDimension
                                                                        .eighteen,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        cartViewModel
                                                                    .isDeliveryDetails
                                                                    .value ==
                                                                false
                                                            ? Icon(Icons
                                                                .keyboard_arrow_down_outlined)
                                                            : Icon(Icons
                                                                .keyboard_arrow_up_outlined)
                                                      ],
                                                    ),
                                                    //
                                                    // InkWell(
                                                    //   onTap: (){
                                                    //     Get.toNamed(RoutesGetters.getAddAddressScreenRoute());
                                                    //   },
                                                    //   child: Text("Add Address",
                                                    //       style: TextStyle(
                                                    //           color: AllColors.orangeColor,
                                                    //           fontSize: AllDimension.fourteen)
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: cartViewModel
                                                    .isDeliveryDetails.value,
                                                child: SizedBox(
                                                  height:
                                                      AllDimension.fourHundred,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        SizedBox(
                                                            height: AllDimension
                                                                .sixteen),
                                                        if (cartViewModel
                                                            .allRetailersLists
                                                            .isNotEmpty)
                                                          InkWell(
                                                            onTap: () {
                                                              Get.to(
                                                                  () =>
                                                                      SelectRetailerDistributor(),
                                                                  arguments: 1);
                                                            },
                                                            child: Stack(
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Retailer",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              AllDimension.sixteen),
                                                                    ),
                                                                    Divider(),
                                                                    Container(
                                                                      padding: EdgeInsets.all(
                                                                          AllDimension
                                                                              .sixteen),
                                                                      width: AllDimension
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(AllDimension
                                                                              .eight),
                                                                          color:
                                                                              AllColors.greyLiColor),
                                                                      child: Text(cartViewModel.selectedRetailerName.value ==
                                                                              ""
                                                                          ? "Select Retailer"
                                                                          : cartViewModel
                                                                              .selectedRetailerName
                                                                              .value),
                                                                    )
                                                                  ],
                                                                ),
                                                                Positioned(
                                                                  right: 8,
                                                                  top: 50,
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_drop_down_outlined,
                                                                    size: AllDimension
                                                                        .twentyFour,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        SizedBox(
                                                            height: AllDimension
                                                                .eight),
                                                        if (cartViewModel
                                                                .selectedRetailerId
                                                                .value !=
                                                            "")
                                                          InkWell(
                                                            onTap: () {
                                                              Get.to(
                                                                  () =>
                                                                      SelectRetailerDistributor(),
                                                                  arguments: 2);
                                                            },
                                                            child: Stack(
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Distributor",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              AllDimension.sixteen),
                                                                    ),
                                                                    Divider(),
                                                                    Container(
                                                                      padding: EdgeInsets.all(
                                                                          AllDimension
                                                                              .sixteen),
                                                                      width: AllDimension
                                                                          .infinity,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(AllDimension
                                                                              .eight),
                                                                          color:
                                                                              AllColors.greyLiColor),
                                                                      child: Text(cartViewModel.selectedDistributorName.value ==
                                                                              ""
                                                                          ? "Select Distributor"
                                                                          : cartViewModel
                                                                              .selectedDistributorName
                                                                              .value),
                                                                    )
                                                                  ],
                                                                ),
                                                                Positioned(
                                                                  right: 8,
                                                                  top: 50,
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_drop_down_outlined,
                                                                    size: AllDimension
                                                                        .twentyFour,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        SizedBox(
                                                            height: AllDimension
                                                                .sixteen),
                                                        if (cartViewModel.allRetailersLists.isNotEmpty && cartViewModel.selectedRetailerId.value != "")
                                                          if (cartViewModel.retilerAddressList.isNotEmpty)
                                                            SizedBox(
                                                              height:
                                                                  AllDimension
                                                                      .oneThirty,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    for (int index =
                                                                            0;
                                                                        index <
                                                                            cartViewModel
                                                                                .retilerAddressList.length;
                                                                        index++)
                                                                      if (cartViewModel
                                                                              .selectedRetailerId
                                                                              .value ==
                                                                          cartViewModel
                                                                              .retilerAddressList[index]
                                                                              .userId!
                                                                              .toString())
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            cartViewModel.setAdderssId(cartViewModel.retilerAddressList[index].id!);
                                                                          },
                                                                          child:
                                                                              Stack(
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children: <Widget>[
                                                                              Container(
                                                                                padding: EdgeInsets.all(AllDimension.sixteen),
                                                                                decoration: BoxDecoration(color: AllColors.whiteColor, borderRadius: BorderRadius.circular(AllDimension.four)),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                  children: <Widget>[
                                                                                    Text(
                                                                                      "Retailer | ${cartViewModel.retilerAddressList[index].name}",
                                                                                      style: TextStyle(fontSize: AllDimension.sixteen, fontWeight: FontWeight.w800),
                                                                                    ),
                                                                                    Text("${cartViewModel.retilerAddressList[index].locality} "
                                                                                        "${cartViewModel.retilerAddressList[index].city} "
                                                                                        "${cartViewModel.retilerAddressList[index].state} "
                                                                                        "${cartViewModel.retilerAddressList[index].country} "
                                                                                        "${cartViewModel.retilerAddressList[index].address}"),
                                                                                    SizedBox(height: AllDimension.sixteen),
                                                                                    Text(
                                                                                      "${cartViewModel.retilerAddressList[index].phone}",
                                                                                      style: TextStyle(fontSize: AllDimension.twelve, fontWeight: FontWeight.w800),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Positioned(
                                                                                right: AllDimension.eight,
                                                                                top: AllDimension.sixteen,
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    cartViewModel.setAdderssId(cartViewModel.retilerAddressList[index].id!);
                                                                                  },
                                                                                  child: Container(
                                                                                    height: AllDimension.twentyFour,
                                                                                    width: AllDimension.twentyFour,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimension.oneHundred), color: cartViewModel.addressId.value == cartViewModel.retilerAddressList[index].id! ? AllColors.greenColor : AllColors.greyLiColor),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                        if (cartViewModel
                                                                .selectedDistributorId
                                                                .value !=
                                                            "")
                                                          SizedBox(
                                                            height: AllDimension
                                                                .oneFifty,
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  for (int index =0;index <cartViewModel.distributorAddressList.length; index++)
                                                                    if (cartViewModel.selectedDistributorId.value == cartViewModel.distributorAddressList[index]
                                                                            .userId!
                                                                            .toString())
                                                                      InkWell(
                                                                        onTap: () {
                                                                          cartViewModel.setAdderssId(cartViewModel.distributorAddressList[index].id!);
                                                                        },
                                                                        child:
                                                                            Stack(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              padding: EdgeInsets.all(AllDimension.sixteen),
                                                                              decoration: BoxDecoration(color: AllColors.whiteColor, borderRadius: BorderRadius.circular(AllDimension.four)),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "Distributorr | ${cartViewModel.distributorAddressList[index].name}",
                                                                                    style: TextStyle(fontSize: AllDimension.sixteen, fontWeight: FontWeight.w800),
                                                                                  ),
                                                                                  Text("${cartViewModel.distributorAddressList[index].locality} "
                                                                                      "${cartViewModel.distributorAddressList[index].city} "
                                                                                      "${cartViewModel.distributorAddressList[index].state} "
                                                                                      "${cartViewModel.distributorAddressList[index].country} "
                                                                                      "${cartViewModel.distributorAddressList[index].address}"),
                                                                                  SizedBox(height: AllDimension.sixteen),
                                                                                  Text(
                                                                                    "${cartViewModel.distributorAddressList[index].phone}",
                                                                                    style: TextStyle(fontSize: AllDimension.twelve, fontWeight: FontWeight.w800),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Positioned(
                                                                              right: AllDimension.eight,
                                                                              top: AllDimension.sixteen,
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  cartViewModel.setAdderssId(cartViewModel.distributorAddressList[index].id!);
                                                                                },
                                                                                child: Container(
                                                                                  height: AllDimension.twentyFour,
                                                                                  width: AllDimension.twentyFour,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimension.oneHundred), color: cartViewModel.addressId.value == cartViewModel.distributorAddressList[index].id! ? AllColors.greenColor : AllColors.greyLiColor),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      AllDimension.twentyFour),
                                              InkWell(
                                                onTap: () {
                                                  if (cartViewModel.addressId.value != 0 &&
                                                      cartViewModel.selectedRetailerId.value != "" &&
                                                      cartViewModel.selectedDistributorId.value != "") {
                                                    cartViewModel.checkout(context);
                                                  }
                                                  else {
                                                    GlobalEquipments
                                                        .SnackToastFailed(
                                                            "Validation error!",
                                                            "Please choose all the details to proceed!");
                                                  }
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.only(
                                                    left:
                                                        AllDimension.twentyFour,
                                                    right:
                                                        AllDimension.twentyFour,
                                                    top: AllDimension.sixteen,
                                                    bottom:
                                                        AllDimension.sixteen,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: AllColors
                                                          .bannerFirstColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AllDimension
                                                                  .four)),
                                                  child: Text(
                                                    "PLACE ORDER",
                                                    style: TextStyle(
                                                        color: AllColors
                                                            .whiteColor,
                                                        fontSize: AllDimension
                                                            .sixteen,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              )))
                    else if (cartViewModel.isCartAvailable.value == 2)
                      Expanded(
                        child: Center(
                          child: Text(
                            "No Cart items!",
                            style: TextStyle(
                                fontSize: AllDimension.thirtyTwo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    else
                      Expanded(child: Placeholders.orderPlaceholder())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
