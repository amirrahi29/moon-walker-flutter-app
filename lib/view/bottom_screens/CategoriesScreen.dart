import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final dashboardViewModel = Get.put(DashboardViewModel());
  final productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Obx(()=>Container(
          margin: EdgeInsets.all(AllDimension.eight),
          child: Column(
            children: <Widget>[
              GlobalToolbar.logoToolbar(context),

              SizedBox(
                height: AllDimension.sixteen,
              ),

              if(dashboardViewModel.categoryList.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(
                      left:AllDimension.twelve,
                      right:AllDimension.twelve,
                  ),
                  child: Row(
                    children: <Widget>[

                      Expanded(
                          child: InkWell(
                            onTap: (){
                              dashboardViewModel.setCategorySelected(true);
                              dashboardViewModel.getDashboardFashionCollections(1);
                            },
                            child: Container(
                                padding: EdgeInsets.all(AllDimension.eight),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AllColors.bannerFirstColor,
                                    borderRadius: BorderRadius.circular(AllDimension.four),
                                  border: Border.all(
                                      color: dashboardViewModel.isCategorySelected.value == true?
                                      AllColors.redColorDark:AllColors.whiteColor,
                                      width: 4// border color
                                  ),
                                ),
                                child: Text("Fashion",
                                  style: TextStyle(
                                      color: AllColors.whiteColor
                                  ),)
                            ),
                          )
                      ),

                      SizedBox(width: AllDimension.sixteen,),

                      Expanded(
                          child: InkWell(
                            onTap: (){
                              dashboardViewModel.setCategorySelected(false);
                              dashboardViewModel.getDashboardFashionCollections(2);
                            },
                            child: Container(
                                padding: EdgeInsets.all(AllDimension.eight),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AllColors.redColorDark,
                                    borderRadius: BorderRadius.circular(AllDimension.four),
                                  border: Border.all(
                                      color: dashboardViewModel.isCategorySelected.value == false?
                                      AllColors.redColorDark:AllColors.whiteColor,
                                      width: 4// border color
                                  ),
                                ),
                                child: Text("Core",
                                  style: TextStyle(
                                      color: AllColors.whiteColor
                                  ),)
                            ),
                          )
                      ),

                    ],
                  ),
                ),

              if(dashboardViewModel.isCollectionAvailable.value == 1)
                Expanded(
                    child: RefreshIndicator(
                      onRefresh: dashboardViewModel.refreshCatList,
                      child: GridView.count(
                        primary: false,
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.height / 1200,
                        children: <Widget>[

                          if(dashboardViewModel.searchCollectionList.isNotEmpty)
                            for (int i = 0; i < dashboardViewModel.searchCollectionList.length; i++)
                              InkWell(
                                onTap: (){
                                  productViewModel.setClearId();
                                  productViewModel.setCollectionId(
                                    dashboardViewModel.searchCollectionList[i].id!,
                                    productViewModel.setId.value,
                                    productViewModel.sortId.value,
                                    productViewModel.search.value,
                                    productViewModel.brandId.value,
                                    "1"
                                  );
                                  Get.toNamed(RoutesGetters.getFilterRoute(),
                                      arguments: dashboardViewModel.searchCollectionList[i].name);
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: <Widget>[

                                    Container(
                                      margin: EdgeInsets.all(AllDimension.eight),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(AllDimension.four)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Container(
                                            height: AllDimension.twoTwenty,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(AllImages.shirt),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(
                                              left:AllDimension.eight,
                                              right:AllDimension.eight,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: <Widget>[

                                                SizedBox(height: AllDimension.eight),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[

                                                    Text(dashboardViewModel.searchCollectionList[i].name! == ""?
                                                    "" :dashboardViewModel.searchCollectionList[i].name!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: AllDimension.twelve
                                                      ),),

                                                  ],
                                                ),

                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )

                        ],
                      ),
                    )
                )
              else if(dashboardViewModel.isCollectionAvailable.value == 2)
                Expanded(
                  child: Center(
                    child: Text("No collections!",
                      style: TextStyle(fontSize: AllDimension.thirtyTwo,
                          fontWeight: FontWeight.bold),),
                  ),
                )
              else
                Expanded(child: Placeholders.productPlaceholder())
              
            ],
          ),
        ))
    );
  }
}
