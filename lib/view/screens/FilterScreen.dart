import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view/screens/FilterDetailScreen.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';
import 'package:moon_walker/view_model/FilterListViewModel.dart';
import 'package:moon_walker/view_model/ProductDetailsViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';
import 'dart:io';
import 'package:to_csv/to_csv.dart' as exportCSV;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final productViewModel = Get.put(ProductViewModel());
  final filterDetailList = Get.put(FilterListViewModel());
  var collectionName = Get.arguments;
  final dashboardViewModel = Get.put(DashboardViewModel());
  final productDetailViewModel = Get.put(ProductDetailsViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productViewModel.isSearchEnabled.value = false;
    productViewModel.productList.clear();
    productViewModel.searchProductList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          drawer: FilterDetailScreen(),
          body: Obx(()=>Stack(
            clipBehavior: Clip.none,
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(AllDimension.eight),
                child: Column(
                  children: <Widget>[

                    GlobalToolbar.backAndSearchToolbar(collectionName),

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
                            hintText: 'Search here....',
                          ),
                          onChanged: (value){
                            productViewModel.searchProduct(value);
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: AllDimension.eight),

                    SizedBox(height: AllDimension.twelve),

                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: AllDimension.fiftyFour),
                            child: RefreshIndicator(
                              onRefresh: productViewModel.refreshList,
                              child: PagedGridView<int, dynamic>(
                                showNewPageProgressIndicatorAsGridChild: false,
                                showNewPageErrorIndicatorAsGridChild: false,
                                showNoMoreItemsIndicatorAsGridChild: false,
                                pagingController: productViewModel.pagingController,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 80 / 125,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                ),
                                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                                  itemBuilder: (context, item, index){
                                    return Column(
                                      children: <Widget>[

                                        if(item != null)
                                          InkWell(
                                            onTap: (){
                                              productDetailViewModel.setColorCode(item.color_code!);
                                              productDetailViewModel.selectedColor(1);
                                              productViewModel.selectedColor(item.color!);
                                              productViewModel.getProductDetailsVm(
                                                item.productId!,
                                                item.color!,
                                              );
                                              Get.toNamed(RoutesGetters.getProductDetailRoute());
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

                                                      item.product!.image==""
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
                                                                image: NetworkImage(item.product!.image!),
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

                                                                if(item.product!.name!.length > 18)
                                                                  Text(item.product!.name! == ""?
                                                                  "" :item.product!.name!.substring(0,18),
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: AllDimension.twelve
                                                                    ),)
                                                                else
                                                                  Text(item.product!.name! == ""?
                                                                  "" :item.product!.name!,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: AllDimension.twelve
                                                                    ),),

                                                                Row(
                                                                  children: <Widget>[

                                                                    Container(
                                                                      height:AllDimension.fourteen,
                                                                      width:AllDimension.fourteen,
                                                                      decoration: BoxDecoration(
                                                                          color: HexColor(item.color_code!),
                                                                          borderRadius: BorderRadius.circular(100)
                                                                      ),
                                                                    ),

                                                                    SizedBox(width: AllDimension.four),

                                                                    Text(item.availableColor! == ""?
                                                                    "" :"+${item.availableColor.toString()}")

                                                                  ],
                                                                )

                                                              ],
                                                            ),

                                                            SizedBox(height: AllDimension.four),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[

                                                                Text(item.product!.totalQuantity! == ""?
                                                                "" :"QTY-"+item.product!.totalQuantity.toString(),
                                                                  style: TextStyle(
                                                                      fontSize: AllDimension.twelve
                                                                  ),),
                                                                Text("${item.product!.price! == ""?
                                                                "" :"₹"+item.product!.price.toString()}",
                                                                  style: TextStyle(
                                                                      fontSize: AllDimension.twelve
                                                                  ),),

                                                              ],
                                                            ),
                                                            SizedBox(height: AllDimension.four),

                                                          ],
                                                        ),
                                                      )

                                                    ],
                                                  ),
                                                ),


                                                if(item.set! == "Cut Set")
                                                  Positioned(
                                                      top:AllDimension.four,
                                                      right:AllDimension.four,
                                                      child: Container(
                                                          alignment: Alignment.center,
                                                          padding: EdgeInsets.only(
                                                            left:AllDimension.sixteen,
                                                            right:AllDimension.twelve,
                                                            top:AllDimension.sixteen,
                                                            bottom:AllDimension.sixteen,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(AllImages.cutSet)
                                                              )
                                                          ),
                                                          child: RotationTransition(
                                                            turns: const AlwaysStoppedAnimation(15 / 360),
                                                            child: Text("CUT \nSET",
                                                              style: TextStyle(
                                                                  color: AllColors.whiteColor,
                                                                  fontSize: AllDimension.twelve
                                                              ),),
                                                          )
                                                      )
                                                  )

                                              ],
                                            ),
                                          )

                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                      )

                  ],
                ),
              ),

              Positioned(
                bottom: AllDimension.sixteen,
                left:AllDimension.eight,
                right:AllDimension.eight,
                child: Container(
                  margin: EdgeInsets.only(
                    left: AllDimension.eight,
                    right: AllDimension.eight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      InkWell(
                        onTap: (){
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                          width: AllDimension.oneHundred,
                          padding: EdgeInsets.all(AllDimension.six),
                          decoration: BoxDecoration(
                              color: AllColors.bannerFirstColor,
                              borderRadius: BorderRadius.circular(AllDimension.four)),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: AllDimension.two),
                              Image.asset(AllImages.filter,
                                  height: AllDimension.fourteen,
                                  width: AllDimension.fourteen),
                              SizedBox(width: AllDimension.twelve),
                              Text(
                                "Filter",
                                style: TextStyle(
                                    color: AllColors.whiteColor,
                                    fontSize: AllDimension.sixteen),
                              )
                            ],
                          ),
                        ),
                      ),


                      InkWell(
                        onTap: ()async{

                          //export to CSV
                          List<String> header = [];
                          header.add('No.');
                          header.add('Product Id');
                          header.add('Name');
                          header.add('Price');
                          header.add('Quantity');

                          List<List<String>> listOfLists = [];

                          for(int i = 0; i<productViewModel.searchProductList.length; i++){
                            List<String> k = [];
                            k = [
                              (i+1).toString(),
                              productViewModel.searchProductList[i].product!.id!.toString(),
                              productViewModel.searchProductList[i].product!.name!.toString(),
                              productViewModel.searchProductList[i].product!.price!.toString(),
                              productViewModel.searchProductList[i].product!.totalQuantity!.toString()
                            ];
                            listOfLists.add(k);
                          }
                          exportCSV.myCSV(header, listOfLists);

                        },
                        child: Container(
                          width: AllDimension.oneHundred,
                          padding: EdgeInsets.all(AllDimension.six),
                          decoration: BoxDecoration(
                              color: AllColors.redColorDark,
                              borderRadius: BorderRadius.circular(AllDimension.four)),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: AllDimension.two),
                              Image.asset(AllImages.export,
                                  height: AllDimension.fourteen,
                                  width: AllDimension.fourteen),
                              SizedBox(width: AllDimension.twelve),
                              Text(
                                "Export",
                                style: TextStyle(
                                    color: AllColors.whiteColor,
                                    fontSize: AllDimension.sixteen),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )),
    ));
  }
}
