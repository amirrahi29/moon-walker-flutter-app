import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view/screens/FilterDetailScreen.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';
import 'package:moon_walker/view_model/FilterListViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';
import 'dart:io';
import 'package:to_csv/to_csv.dart' as exportCSV;

class AllCollections extends StatefulWidget {
  const AllCollections({Key? key}) : super(key: key);

  @override
  State<AllCollections> createState() => _AllCollectionsState();
}

class _AllCollectionsState extends State<AllCollections> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final dashboardViewModel = Get.put(DashboardViewModel());
  final productViewModel = Get.put(ProductViewModel());
  final filterListViewModel = Get.put(FilterListViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(()=>Container(
            margin: EdgeInsets.all(AllDimension.eight),
            child: Column(
              children: <Widget>[

                GlobalToolbar.backAndSearchToolbar("All Collections"),

                SizedBox(height: AllDimension.eight),

                Visibility(
                  visible: dashboardViewModel.isEnableSearch.value,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: AllDimension.eight,
                      right: AllDimension.eight,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AllDimension.sixteen,
                            horizontal: AllDimension.sixteen
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AllDimension.eight),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: AllColors.lightGreyColor,
                        filled: true,
                        suffixIcon: Icon(Icons.search,
                            color: AllColors.greyColor
                        ),
                        hintText: 'Search for articles',
                      ),
                      onChanged: (value){
                        dashboardViewModel.searchCollection(value);
                      },
                    ),
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

                                            dashboardViewModel.searchCollectionList[i].image! == ""
                                            ?Container(
                                              height: AllDimension.twoTwenty,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(AllImages.shirt),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ):
                                            Container(
                                              height: AllDimension.twoTwenty,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(dashboardViewModel.searchCollectionList[i].image!),
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
          )),
        ));
  }
}
