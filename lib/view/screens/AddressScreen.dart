import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:get/get.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/AddressViewModel.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final addressViewModel = Get.put(AddressViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
      Obx(() => Stack(
        children: <Widget>[

          Column(
            children: <Widget>[
              GlobalToolbar.backToolbar("Addresses", context),
              if (addressViewModel.addressList.isNotEmpty)
                Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: AllDimension.eight,
                            right: AllDimension.eight,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search here',
                                prefixIcon: Icon(Icons.search)),
                            onChanged: (value) {
                              addressViewModel.searchOrders(value);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: AllDimension.fiftyFour,
                            left: AllDimension.eight,
                            right: AllDimension.eight,
                          ),
                          child: RefreshIndicator(
                            onRefresh: addressViewModel.refreshList,
                            child: ListView.builder(
                                itemCount:
                                addressViewModel.addressSearchList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin:
                                    EdgeInsets.only(bottom: AllDimension.eight),
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
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Name: ",
                                                      style: TextStyle(
                                                        fontSize:
                                                        AllDimension.twelve,
                                                      )),
                                                  Text(
                                                      addressViewModel
                                                          .addressSearchList[
                                                      index]
                                                          .name ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize:
                                                          AllDimension.twelve,
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: AllDimension.eight),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Email: ",
                                                      style: TextStyle(
                                                        fontSize:
                                                        AllDimension.twelve,
                                                      )),
                                                  Text(
                                                      addressViewModel
                                                          .addressSearchList[
                                                      index]
                                                          .email ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize:
                                                          AllDimension.twelve,
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: AllDimension.eight),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Phone: ",
                                                      style: TextStyle(
                                                        fontSize:
                                                        AllDimension.twelve,
                                                      )),
                                                  Text(
                                                      addressViewModel
                                                          .addressSearchList[
                                                      index]
                                                          .phone ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize:
                                                          AllDimension.twelve,
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ))
            ],
          ),

          Positioned(
            right:AllDimension.sixteen,
              bottom:AllDimension.sixteen,
              child: FloatingActionButton(
                backgroundColor: AllColors.redColorDark,
                onPressed: (){
                  Get.toNamed(RoutesGetters.getAddAddressScreenRoute());
                },
                child: Icon(Icons.add),
              )
          )

        ],
      )),
    );
  }
}
