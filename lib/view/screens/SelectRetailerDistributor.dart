import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/view_model/CartViewModel.dart';

class SelectRetailerDistributor extends StatefulWidget {
  const SelectRetailerDistributor({Key? key}) : super(key: key);

  @override
  State<SelectRetailerDistributor> createState() => _SelectRetailerDistributorState();
}

class _SelectRetailerDistributorState extends State<SelectRetailerDistributor> {

  final cartViewModel = Get.put(CartViewModel());
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AllDimension.twentyFour,
        right: AllDimension.twentyFour,
        top: AllDimension.twentyFour,
        bottom: AllDimension.twentyFour,
      ),
      child: Obx(()=>SafeArea(
          child: Scaffold(
            body: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[

                Container(
                  margin: EdgeInsets.all(AllDimension.eight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        children: <Widget>[

                          Expanded(
                              child: Text(data==1?"All Retailers":"All Distributors",
                                style: TextStyle(fontSize: AllDimension.twentyFour),)
                          ),

                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AllColors.redColor,
                                  borderRadius: BorderRadius.circular(AllDimension.oneHundred)
                              ),
                              child: Icon(Icons.close,size: AllDimension.thirtyFive,
                                color: AllColors.whiteColor,),
                            ),
                          )

                        ],
                      ),
                      Divider()

                    ],
                  ),
                ),

                if(data == 1)
                  if(cartViewModel.allRetailersLists.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: AllDimension.fiftyFour,
                        left: AllDimension.sixteen,
                        right: AllDimension.sixteen,),
                      child: ListView.builder(
                          itemCount: cartViewModel.allRetailersLists.length,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                cartViewModel.setSelectedRetailer(
                                  cartViewModel.allRetailersLists[index].id!.toString(),
                                  cartViewModel.allRetailersLists[index].name!.toString(),
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: AllColors.lightGreyColor,
                                padding: EdgeInsets.all(AllDimension.twelve),
                                margin: EdgeInsets.all(AllDimension.eight),
                                child: Text(cartViewModel.allRetailersLists[index].name.toString()),
                              ),
                            );
                          }
                      ),
                    ),

                if(data == 2)
                  if(cartViewModel.allDistributorsLists.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: AllDimension.fiftyFour,
                        left: AllDimension.sixteen,
                        right: AllDimension.sixteen,),
                      child: ListView.builder(
                          itemCount: cartViewModel.allDistributorsLists.length,
                          itemBuilder: (context,index){
                            if(cartViewModel.selectedRetailerId.value == cartViewModel.allDistributorsLists[index].retailer_id!.toString()){
                              return InkWell(
                                onTap: (){
                                  cartViewModel.setSelectedDistributor(
                                    cartViewModel.allDistributorsLists[index].id!.toString(),
                                    cartViewModel.allDistributorsLists[index].name!.toString(),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  color: AllColors.lightGreyColor,
                                  padding: EdgeInsets.all(AllDimension.twelve),
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(cartViewModel.allDistributorsLists[index].name!.toString()),
                                ),
                              );
                            }
                            return SizedBox.shrink();
                          }
                      ),
                    )
              ],
            ),
          )
      )),
    );
  }
}
