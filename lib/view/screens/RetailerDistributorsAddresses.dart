import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/CartViewModel.dart';

class RetailerDistributorsAddresses extends StatefulWidget {
  const RetailerDistributorsAddresses({Key? key}) : super(key: key);

  @override
  State<RetailerDistributorsAddresses> createState() => _RetailerDistributorsAddressesState();
}

class _RetailerDistributorsAddressesState extends State<RetailerDistributorsAddresses> {

  final cartViewModel = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Obx(()=>SingleChildScrollView(
          child: Column(
            children: <Widget>[

              GlobalToolbar.backToolbar("Addresses",context),

              SizedBox(height: AllDimension.eight),

              // for(int index = 0; index<cartViewModel.addressList.length; index++)
              //  InkWell(
              //    onTap: (){
              //      cartViewModel.setAdderssId(cartViewModel.addressList[index].id!);
              //      Get.back();
              //    },
              //    child: Container(
              //      color: AllColors.lightGreyColor,
              //      padding: EdgeInsets.all(AllDimension.eight),
              //      margin: EdgeInsets.all(AllDimension.eight),
              //      child: Column(
              //        crossAxisAlignment: CrossAxisAlignment.stretch,
              //        children: <Widget>[
              //
              //          Text("${cartViewModel.addressList[index].name}"),
              //          Text("${cartViewModel.addressList[index].city} "
              //              "${cartViewModel.addressList[index].state} "
              //              "${cartViewModel.addressList[index].country} "
              //              "${cartViewModel.addressList[index].pincode}"),
              //
              //        ],
              //      ),
              //    ),
              //  )

            ],
          ),
        ))
    );
  }
}