import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view_model/QueryViewModel.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {

  final queryController = TextEditingController();
  final queryViewModel = Get.put(QueryViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        SingleChildScrollView(
            child: Column(
              children: <Widget>[

                GlobalToolbar.backToolbar("Contact us",context),

                Container(
                  margin: EdgeInsets.all(AllDimension.sixteen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.all(AllDimension.sixteen),
                        child: Text("WE'D LOVE TO HER FROM YOU",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AllColors.blueColorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: AllDimension.thirtyTwo
                          ),),
                      ),

                      SizedBox(height: AllDimension.sixteen),

                      TextField(
                        controller: queryController,
                        minLines: 6, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AllDimension.eight)
                          ),
                          hintText: 'Write your query here...',
                          labelText: 'Your Query*',
                        ),
                      ),

                      SizedBox(height: AllDimension.sixteen),

                      InkWell(
                        onTap: (){
                          if(queryController.text != "" || queryController.text.length <500){
                            queryViewModel.ssaveQuery(queryController.text,context);
                          } else{
                            GlobalEquipments.SnackToastFailed("Validation error",
                                "Please enter valid query and try again!");
                          }
                        },
                        child: Container(
                          width: AllDimension.oneTwenty,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: AllDimension.twentyFour,
                            right: AllDimension.twentyFour,
                            top: AllDimension.eight,
                            bottom: AllDimension.eight,
                          ),
                          decoration: BoxDecoration(
                              color: AllColors.blueColorLight,
                              borderRadius: BorderRadius.circular(AllDimension.four)),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: AllColors.whiteColor,
                                fontSize: AllDimension.eighteen),
                          ),
                        ),
                      )

                    ],
                  ),
                ),

                Container(
                  height: AllDimension.oneFifty,
                  width: AllDimension.infinity,
                  margin: EdgeInsets.only(
                      bottom: AllDimension.sixteen
                  ),
                  decoration: BoxDecoration(
                    color: AllColors.lightGreyColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Icon(Icons.mail_outline_outlined,
                          color: AllColors.blackColor,
                          size: AllDimension.fourty),
                      Text("info@moonwalkerindia.com",
                        style: TextStyle(
                            fontSize: AllDimension.sixteen
                        ),)

                    ],
                  ),
                ),

                Container(
                  height: AllDimension.oneFifty,
                  width: AllDimension.infinity,
                  margin: EdgeInsets.only(
                      bottom: AllDimension.sixteen
                  ),
                  decoration: BoxDecoration(
                    color: AllColors.greenDarkColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Icon(Icons.phone,
                          color: AllColors.blackColor,
                          size: AllDimension.fourty),
                      Text("+91 987 654 3210",
                        style: TextStyle(
                            fontSize: AllDimension.sixteen
                        ),)

                    ],
                  ),
                ),

                Container(
                  height: AllDimension.oneFifty,
                  width: AllDimension.infinity,
                  margin: EdgeInsets.only(
                      bottom: AllDimension.sixteen
                  ),
                  decoration: BoxDecoration(
                    color: AllColors.lightGreyColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Icon(Icons.account_balance_rounded,
                          color: AllColors.blackColor,
                          size: AllDimension.fourty),
                      Text("Moon Walker India",
                        style: TextStyle(
                            fontSize: AllDimension.sixteen
                        ),)

                    ],
                  ),
                )

              ],
            )
        )
    );
  }
}
