import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalHomeComponents.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final dashboardViewModel = Get.put(DashboardViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        RefreshIndicator(
          onRefresh: dashboardViewModel.refreshList,
          child: ListView(
            children: [

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    InkWell(
                        onTap: (){
                        },
                        child: GlobalToolbar.logoToolbar(context)),
                    GlobalHomeComponents.salsBanner(),
                    //GlobalHomeComponents.CategorySection(),
                    GlobalHomeComponents.BannerCarousal(),
                    //GlobalHomeComponents.offersDisplayCarousal(),

                    SizedBox(height: AllDimension.four),

                    GlobalHomeComponents.newCategory(),

                    SizedBox(height: AllDimension.eighteen),

                    GlobalHomeComponents.categoryProductSection1(context,"Collections"),

                  ],
                ),
              )

            ],
          ),
        )
    );
  }

}
