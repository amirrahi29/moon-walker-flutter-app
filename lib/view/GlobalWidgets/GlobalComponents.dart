import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';

class GlobalComponents{

  static Widget retailOrderScreen(String title){
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(height: AllDimension.thirtyTwo),
          Image.asset(AllImages.error,
              height: AllDimension.twoHundred,
              width: AllDimension.twoHundred),
          Container(
            margin: EdgeInsets.only(
                left: AllDimension.fortyEight,
                right: AllDimension.fortyEight,
                top: AllDimension.twentyFour),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AllDimension.twentyEight,
                  color: AllColors.redColorDark,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: AllDimension.fourty),
          Divider()
        ],
      ),
    );
  }

}