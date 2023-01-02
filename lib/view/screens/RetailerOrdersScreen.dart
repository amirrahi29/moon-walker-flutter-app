import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalHomeComponents.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalRetails.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/MainViewModel.dart';
import 'package:moon_walker/view_model/OrderViewModel.dart';

class RetailerOrdersScreen extends StatefulWidget {
  const RetailerOrdersScreen({Key? key}) : super(key: key);

  @override
  State<RetailerOrdersScreen> createState() => _RetailerOrdersScreenState();
}

class _RetailerOrdersScreenState extends State<RetailerOrdersScreen> {

  final mainViewModel = Get.put(MainViewModel());
  final orderViewModel = Get.put(OrderViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Stack(
          children: <Widget>[

            GlobalToolbar.backToolbar("All Orders", context),

            Obx(()=>Container(
              margin: EdgeInsets.only(top: AllDimension.fortyEight,
                  left: AllDimension.eight,
                  right: AllDimension.eight),
              child: Column(
                children: <Widget>[

                  TextField(
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
                      orderViewModel.searchOrders(value);
                    },
                  ),

                  if(orderViewModel.isOrderAvailable.value == 1)
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: orderViewModel.refreshList,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
                          itemCount: orderViewModel.searchList.length,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                orderViewModel.getOrderDetailsVm(orderViewModel.searchList[index].id!);
                                Get.toNamed(RoutesGetters.getOrderDetailScreenRoute());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Container(
                                    padding: EdgeInsets.all(AllDimension.eight),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[


                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: <Widget>[

                                            Row(
                                              children: <Widget>[

                                                Image.network(orderViewModel.searchList[index].user!.avatar!,
                                                  height: AllDimension.fifty,),

                                                SizedBox(width: AllDimension.eight,),

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[

                                                    Text("Order: #${orderViewModel.searchList[index].orderNo??""}",
                                                      style: TextStyle(fontSize: AllDimension.sixteen,
                                                          color: AllColors.blackColor,fontWeight: FontWeight.bold),),

                                                    Text("Name: ${orderViewModel.searchList[index].user!.name??""}"),
                                                    Text("E-mail: ${orderViewModel.searchList[index].user!.email??""}"),

                                                  ],
                                                )

                                              ],
                                            ),

                                            Positioned(
                                              right:0,
                                              child: Card(
                                                color: orderViewModel.searchList[index].status == "Pending"?
                                                  AllColors.redColor
                                                :AllColors.greenDarkColor,
                                                child: Container(
                                                  padding: EdgeInsets.all(AllDimension.eight),
                                                  child: Column(
                                                    children: <Widget>[

                                                      Text("${orderViewModel.searchList[index].status??""}",
                                                        style: TextStyle(color: AllColors.whiteColor),)

                                                    ],
                                                  ),
                                                ),
                                              )
                                            )

                                          ],
                                        )

                                      ],
                                    ),
                                  )

                                ],
                              ),
                            );
                          }
                      ),
                    ),
                  )
                  else if(orderViewModel.isOrderAvailable.value == 2)
                    Expanded(
                      child: Center(
                        child: Text("No orders!",
                          style: TextStyle(fontSize: AllDimension.thirtyTwo,
                              fontWeight: FontWeight.bold),),
                      ),
                    )
                  else
                    Expanded(child: Placeholders.orderPlaceholder())

                ],
              ),
            )
            ),

            // Positioned(
            //     bottom: AllDimension.seventy,
            //     right: AllDimension.sixteen,
            //     child: FloatingActionButton(
            //       backgroundColor: AllColors.redColorDark,
            //       onPressed: (){
            //         GlobalRetails.globalRetailsFilter(context);
            //       },
            //       child: const Icon(Icons.filter_list_outlined),
            //     )
            // )

          ],
        )
    );
  }
}
