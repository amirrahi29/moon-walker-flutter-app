import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';
import 'package:moon_walker/view_model/RetailerDistributorViewModel.dart';

class DistributorsScreen extends StatefulWidget {
  const DistributorsScreen({Key? key}) : super(key: key);

  @override
  State<DistributorsScreen> createState() => _DistributorsScreenState();
}

class _DistributorsScreenState extends State<DistributorsScreen> {

  final retailerDistributorViewModel = Get.put(RetailerDistributorViewModel());
  final mainViewModel = Get.put(MainViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Obx(()=>Column(
          children: <Widget>[

            GlobalToolbar.backToolbar("Distributors",context),

            if(retailerDistributorViewModel.allDistributors.isNotEmpty)
             Expanded(
                child:Stack(

                  clipBehavior: Clip.none,
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(
                        left: AllDimension.eight,
                        right: AllDimension.eight,
                      ),
                      child: TextField(
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
                          hintText: 'Search here....',
                        ),
                        onChanged: (value){
                          retailerDistributorViewModel.searchDistributorsOrders(value);
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        top: AllDimension.sixtyFour,
                        left: AllDimension.eight,
                        right: AllDimension.eight,
                      ),
                      child:  RefreshIndicator(
                        onRefresh: retailerDistributorViewModel.refreshList,
                        child: ListView.builder(
                            itemCount: retailerDistributorViewModel.allDistributorsSearch.length,
                            itemBuilder: (context,index){
                              return Container(
                                margin: EdgeInsets.only(bottom: AllDimension.eight),
                                padding: EdgeInsets.all(
                                    AllDimension.eight
                                ),
                                decoration: BoxDecoration(
                                    color: AllColors.lightGreyColor,
                                    borderRadius: BorderRadius.circular(
                                        AllDimension.four
                                    )
                                ),
                                child: Column(
                                  children: <Widget>[

                                    Row(
                                      children: <Widget>[

                                        Container(
                                          child: Row(
                                            children: <Widget>[

                                              Text("Name: ",
                                                  style: TextStyle(
                                                    fontSize: AllDimension.twelve,
                                                  )),
                                              Text(retailerDistributorViewModel.allDistributorsSearch[index].name??"",
                                                  style: TextStyle(
                                                      fontSize: AllDimension.twelve,
                                                      fontWeight: FontWeight.bold
                                                  )),

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
                                                    fontSize: AllDimension.twelve,
                                                  )),
                                              Text(retailerDistributorViewModel.allDistributorsSearch[index].email??"",
                                                  style: TextStyle(
                                                      fontSize: AllDimension.twelve,
                                                      fontWeight: FontWeight.bold
                                                  )),

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
                                                    fontSize: AllDimension.twelve,
                                                  )),
                                              Text(retailerDistributorViewModel.allDistributorsSearch[index].phone??"",
                                                  style: TextStyle(
                                                      fontSize: AllDimension.twelve,
                                                      fontWeight: FontWeight.bold
                                                  )),

                                            ],
                                          ),
                                        )

                                      ],
                                    )

                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                    ),

                  ],
                )
            )
            else if(retailerDistributorViewModel.isDistributorAvailable.value == 2)
              Expanded(
                child: Center(
                  child: Text("No Distributors!",
                    style: TextStyle(fontSize: AllDimension.thirtyTwo,
                        fontWeight: FontWeight.bold),),
                ),
              )
            else
              Expanded(child: Placeholders.orderPlaceholder())

          ],
        ))
    );
  }
}
