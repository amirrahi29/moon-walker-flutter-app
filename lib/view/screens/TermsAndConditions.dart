import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        SingleChildScrollView(
          child: Column(
            children: <Widget>[

              GlobalToolbar.backToolbar("Terms of Use",context),

              SizedBox(height: AllDimension.eight),

              Container(
                margin: EdgeInsets.all(AllDimension.eight),
                alignment: Alignment.center,
                child: Text("Terms & Condition",style: TextStyle(
                    fontSize: AllDimension.twentyEight,
                    color: AllColors.blueColorLight,
                    fontWeight: FontWeight.bold
                ),),
              ),

              SizedBox(height: AllDimension.eight),

              Container(
                margin: EdgeInsets.all(AllDimension.eight),
                alignment: Alignment.centerLeft,
                child: Text("Lorem ipsum dolor sit, amet consectetur adipisicing elit. Cum, voluptatibus. Repellendus "
                    "magnam maiores iste voluptatem, cupiditate ducimus nostrum voluptate minus nisi id blanditiis! Et "
                    "ratione voluptates mollitia exercitationem inventore. Maiores! Lorem ipsum dolor sit, amet consectetur "
                    "adipisicing elit. Cum, voluptatibus. Repellendus magnam maiores iste voluptatem, cupiditate ducimus "
                    "nostrum voluptate minus nisi id blanditiis! Et ratione voluptates mollitia exercitationem inventore. "
                    "Maiores!, amet consectetur adipisicing elit. Cum, voluptatibus. Repellendus "
                    "magnam maiores iste voluptatem, cupiditate ducimus nostrum voluptate minus nisi id blanditiis! Et "
                    "ratione voluptates mollitia exercitationem inventore. Maiores! Lorem ipsum dolor sit, amet consectetur "
                    "adipisicing elit. Cum, voluptatibus. Repellendus magnam maiores iste voluptatem, cupiditate ducimus "
                    "nostrum voluptate minus nisi id blanditiis! Et ratione voluptates mollitia exercitationem inventore. "
                    "Maiores!, amet consectetur adipisicing elit. Cum, voluptatibus. Repellendus "
                    "magnam maiores iste voluptatem, cupiditate ducimus nostrum voluptate minus nisi id blanditiis! Et "
                    "ratione voluptates mollitia exercitationem inventore. Maiores! Lorem ipsum dolor sit, amet consectetur "
                    "adipisicing elit. Cum, voluptatibus. Repellendus magnam maiores iste voluptatem, cupiditate ducimus "
                    "nostrum voluptate minus nisi id blanditiis! Et ratione voluptates mollitia exercitationem inventore. "
                    "Maiores!",style: TextStyle(
                    fontSize: AllDimension.sixteen
                ),),
              )


            ],
          ),
        )
    );
  }
}