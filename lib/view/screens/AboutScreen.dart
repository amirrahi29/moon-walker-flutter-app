import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        SingleChildScrollView(
          child: Column(
            children: <Widget>[

              GlobalToolbar.backToolbar("About us",context),

              Container(
                height: AllDimension.threeHundred,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AllImages.shirt),
                        fit: BoxFit.cover
                    )
                ),
              ),

              SizedBox(height: AllDimension.twentyFour),

              Container(
                margin: EdgeInsets.all(AllDimension.eight),
                alignment: Alignment.centerLeft,
                child: Text("OUR BRAND",style: TextStyle(
                    fontSize: AllDimension.twentyFour,
                    color: AllColors.blueColorLight,
                    fontWeight: FontWeight.bold
                ),),
              ),

              SizedBox(height: AllDimension.sixteen),

              Container(
                margin: EdgeInsets.only(
                  left: AllDimension.eight,
                  right: AllDimension.eight,
                  top: AllDimension.eight,
                ),
                alignment: Alignment.centerLeft,
                child: Text("WHAT WE STAND FOR",style: TextStyle(
                    fontSize: AllDimension.sixteen,
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.bold
                ),),
              ),

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