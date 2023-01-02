import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Container(
          color: AllColors.whiteColor,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // GlobalToolbar.backToolbar("",context),
              SizedBox(height: AllDimension.oneHundred),

              Image.asset(AllImages.success,
                  height: AllDimension.twoHundred,
                  width: AllDimension.twoHundred),

              Text("ORDER PLACED",
                style: TextStyle(
                    fontSize: AllDimension.thirtyTwo,
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.bold
                ),),

              SizedBox(height: AllDimension.sixteen),

              Text("Thank you for placing order",
                style: TextStyle(
                    fontSize: AllDimension.sixteen
                ),),

              SizedBox(height: AllDimension.sixteen),

              Text("Your order will be delivered by ",
                style: TextStyle(
                    fontSize: AllDimension.sixteen
                ),),

              // Text("Dec.05, Mon (6am - 9 am)",
              //   style: TextStyle(
              //       fontSize: AllDimension.sixteen,
              //       fontWeight: FontWeight.bold
              //   ),),

              SizedBox(height: AllDimension.twentyFour),

              InkWell(
                onTap: (){
                  Get.offAllNamed(RoutesGetters.getDashboardRoute());
                },
                child: Text("Go to Home",
                  style: TextStyle(
                    color: AllColors.orangeColor,
                    fontSize: AllDimension.sixteen,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),),
              ),


            ],
          ),
        )
    );
  }
}
