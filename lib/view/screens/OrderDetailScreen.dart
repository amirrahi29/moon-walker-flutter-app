import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/OrderViewModel.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {

  final orderViewModel = Get.put(OrderViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
       Obx(()=>Stack(
         clipBehavior: Clip.none,
         children: <Widget>[

           Positioned(
               child: GlobalToolbar.backToolbar("Order #${orderViewModel.orderNo??""}",context)
           ),

           Container(
             margin: EdgeInsets.only(
               top: AllDimension.fortyEight
             ),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(height: AllDimension.eight),

                   Container(
                     margin: EdgeInsets.all(AllDimension.eight),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text("User Details",
                               style: TextStyle(fontSize: AllDimension.twenty,
                                   fontWeight: FontWeight.bold,color: AllColors.blackColor),),
                             Divider(),

                             Container(
                               alignment: Alignment.centerLeft,
                               child: Image.network(orderViewModel.userImage.value??"",
                                 height: AllDimension.twoHundred,
                                 fit: BoxFit.cover,),
                             ),

                             Text("Name: ${orderViewModel.userName??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Email: ${orderViewModel.userEmail??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Phone: ${orderViewModel.userPhone??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                           ],
                         ),
                         SizedBox(height: AllDimension.sixteen),

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text("Order Details",
                               style: TextStyle(fontSize: AllDimension.twenty,
                                   fontWeight: FontWeight.bold,color: AllColors.blackColor),),
                             Divider(),

                             Text("Product Name"),
                             SizedBox(
                               height: AllDimension.sixtyFour,
                               child: ListView.builder(
                                   itemCount: orderViewModel.productList.length,
                                   itemBuilder: (context,index){
                                     return Text(orderViewModel.productList[index]);
                                   }
                               ),
                             ),

                             Text("Distributor SubTotal: ${orderViewModel.distributoSubtotal??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Distributor Tax: ${orderViewModel.distributorTax??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Distributor Shipping: ${orderViewModel.distributorShipping??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Distributor Coupon Discount: ${orderViewModel.distributorCouponDiscount??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Distributor Discount: ${orderViewModel.distributorDiscount??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Distributor Total: ${orderViewModel.distributorTotal??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Retailer SubTotal: ${orderViewModel.retailerSubtotal??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Retailer Tax: ${orderViewModel.retailerTax??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Retailer Shipping: ${orderViewModel.retailerShipping??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Retailer Coupon Discount: ${orderViewModel.retailerCouponDiscount??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Retailer Total: ${orderViewModel.retailerTotal??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Payment Mode: ${orderViewModel.paymentMode??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Status: ${orderViewModel.status??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                           ],
                         ),
                         SizedBox(height: AllDimension.sixteen),

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text("Salesman Details",
                               style: TextStyle(fontSize: AllDimension.twenty,
                                   fontWeight: FontWeight.bold,color: AllColors.blackColor),),
                             Divider(),
                             //
                             // Container(
                             //   alignment: Alignment.centerLeft,
                             //   child: Image.network(orderViewModel.salesmanImage.value??"",
                             //     height: AllDimension.twoHundred,
                             //     fit: BoxFit.cover,),
                             // ),

                             Text("Name: ${orderViewModel.salesmanName??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Email: ${orderViewModel.salesmanEmail??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Phone: ${orderViewModel.salesmanPhone??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                           ],
                         ),
                         SizedBox(height: AllDimension.sixteen),

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text("Distributors Details",
                               style: TextStyle(fontSize: AllDimension.twenty,
                                   fontWeight: FontWeight.bold,color: AllColors.blackColor),),
                             Divider(),
                             //
                             // Container(
                             //   alignment: Alignment.centerLeft,
                             //   child: Image.network(orderViewModel.salesmanImage.value??"",
                             //     height: AllDimension.twoHundred,
                             //     fit: BoxFit.cover,),
                             // ),

                             Text("Name: ${orderViewModel.distributorName??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Email: ${orderViewModel.distributorEmail??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Phone: ${orderViewModel.distributorPhone??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),


                           ],
                         ),
                         SizedBox(height: AllDimension.sixteen),

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text("Address Details",
                               style: TextStyle(fontSize: AllDimension.twenty,
                                   fontWeight: FontWeight.bold,color: AllColors.blackColor),),
                             Divider(),
                             Text("Name: ${orderViewModel.addressName??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Email: ${orderViewModel.addressEmail??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Phone: ${orderViewModel.addressPhone??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),

                             Text("Address: ${orderViewModel.addressAddress??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Locality: ${orderViewModel.addresslocality??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("City: ${orderViewModel.addressCity??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("State: ${orderViewModel.addressState??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Country: ${orderViewModel.addressCountry??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Pin Code: ${orderViewModel.addressPincode??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),
                             Text("Address Type: ${orderViewModel.addressType??""}",
                               style: TextStyle(fontSize: AllDimension.sixteen),),


                           ],
                         ),
                         SizedBox(height: AllDimension.sixteen),

                       ],
                     ),
                   ),
                   SizedBox(height: AllDimension.eight),

                 ],
               ),
             ),
           ),

         ],
       ))
    );
  }
}