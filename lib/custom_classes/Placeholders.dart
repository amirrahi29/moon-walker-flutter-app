import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:shimmer/shimmer.dart';
import 'AllDimension.dart';
import 'AllImages.dart';

class Placeholders{

  static Widget categoryPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AllColors.greyLiColor!,
      highlightColor: Colors.white70,
      child: Row(
        children: <Widget>[

          Expanded(
            flex: 1,
            child: Container(
              height: AllDimension.oneEighty,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(AllDimension.eight)
              ),
              child: Image.asset(AllImages.shirt),
            ),
          ),

          SizedBox(width: AllDimension.sixteen),

          Expanded(
            flex: 1,
            child: Container(
              height: AllDimension.oneEighty,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(AllDimension.eight)
              ),
              child: Image.asset(AllImages.shirt),
            ),
          )

        ],
      ),
    );
  }

  static Widget collectionPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AllColors.greyLiColor!,
      highlightColor: Colors.white70,
      child: Container(
        margin: EdgeInsets.only(
          left: AllDimension.eight,
          right: AllDimension.eight,
          top: AllDimension.eight,
        ),
        child: Column(
          children: <Widget>[

            for(int i = 0; i<3; i++)
            Column(
              children: <Widget>[

                Row(
                  children: <Widget>[

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: AllDimension.oneEighty,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(AllDimension.eight)
                        ),
                        child: Image.asset(AllImages.shirt),
                      ),
                    ),

                    SizedBox(width: AllDimension.sixteen),

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: AllDimension.oneEighty,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(AllDimension.eight)
                        ),
                        child: Image.asset(AllImages.shirt),
                      ),
                    ),

                    SizedBox(width: AllDimension.sixteen),

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: AllDimension.oneEighty,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(AllDimension.eight)
                        ),
                        child: Image.asset(AllImages.shirt),
                      ),
                    )

                  ],
                ),
                SizedBox(height: AllDimension.eight)

              ],
            )

          ],
        ),
      ),
    );
  }

  static Widget bannerPlaceholder(){
    return Shimmer.fromColors(
      baseColor: AllColors.greyLiColor!,
      highlightColor: Colors.white70,
      child: Container(
        height: AllDimension.twoHundred,
        width: AllDimension.infinity,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(AllDimension.eight)
        ),
        child: Image.asset(AllImages.shirt),
      ),
    );
  }

  static Widget productPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AllColors.greyLiColor!,
      highlightColor: Colors.white70,
      child: ListView(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(
              left: AllDimension.eight,
              right: AllDimension.eight,
              top: AllDimension.eight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                for(int i = 0; i<4; i++)
                  Column(
                    children: <Widget>[

                      Row(
                        children: <Widget>[

                          Expanded(
                            flex: 1,
                            child: Container(
                              height: AllDimension.oneEighty,
                              decoration: BoxDecoration(
                                  color: AllColors.greyColor,
                                  borderRadius: BorderRadius.circular(AllDimension.eight)
                              ),
                              child: Image.asset(AllImages.shirt),
                            ),
                          ),

                          SizedBox(width: AllDimension.sixteen),

                          Expanded(
                            flex: 1,
                            child: Container(
                              height: AllDimension.oneEighty,
                              decoration: BoxDecoration(
                                  color: AllColors.greyColor,
                                  borderRadius: BorderRadius.circular(AllDimension.eight)
                              ),
                              child: Image.asset(AllImages.shirt),
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: AllDimension.eight)

                    ],
                  )

              ],
            ),
          )

        ],
      ),
    );
  }

  static Widget orderPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AllColors.greyLiColor!,
      highlightColor: Colors.white70,
      child: ListView(
        children: <Widget>[

          for(int i = 0; i<10; i++)
          Container(
            margin: EdgeInsets.only(
              left: AllDimension.eight,
              right: AllDimension.eight,
              top: AllDimension.eight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                for(int i = 0; i<3; i++)
                  Column(
                    children: <Widget>[

                      Container(
                        height: AllDimension.twenty,
                        width: AllDimension.infinity,
                        decoration: BoxDecoration(
                            color: AllColors.greyColor,
                            borderRadius: BorderRadius.circular(AllDimension.eight)
                        ),
                        child: Image.asset(AllImages.shirt),
                      ),

                    ],
                  )

              ],
            ),
          )

        ],
      ),
    );
  }

}