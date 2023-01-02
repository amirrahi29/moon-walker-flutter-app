import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/screens/FilterDetailScreen.dart';
import 'package:moon_walker/view_model/FilterListViewModel.dart';
import 'package:moon_walker/view_model/ProductDetailsViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';
import 'dart:io';
import 'package:to_csv/to_csv.dart' as exportCSV;

class SeachProductsScreen extends StatefulWidget {
  const SeachProductsScreen({Key? key}) : super(key: key);

  @override
  State<SeachProductsScreen> createState() => _SeachProductsScreenState();
}

class _SeachProductsScreenState extends State<SeachProductsScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final productViewModel = Get.put(ProductViewModel());
  final filterDetailList = Get.put(FilterListViewModel());
  final productDetailViewModel = Get.put(ProductDetailsViewModel());
  var collectionName = Get.arguments;

  String? searchText;

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
                margin: EdgeInsets.only(top: AllDimension.twentyFour,
                    left: AllDimension.eight,
                    right: AllDimension.eight),
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
                    prefixIcon: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_outlined,
                          color: AllColors.greyColor
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: (){
                        productViewModel.searchCollectionRelatedProduct(searchText!,"1");
                      },
                      child: Icon(Icons.search,
                          color: AllColors.greyColor
                      ),
                    ),
                    hintText: 'Search here....',
                  ),
                  onChanged: (value){
                    setState(() {
                      searchText = value;
                    });
                   if(value.length==2){
                     productViewModel.searchCollectionRelatedProduct(value,"1");
                   }
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top:AllDimension.eightyFour
                ),
                child: Column(
                  children: <Widget>[

                    SizedBox(height: AllDimension.eight),

                    if(productViewModel.isProductAvailable.value == 1)
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: AllDimension.fifty),
                            child: RefreshIndicator(
                              onRefresh: productViewModel.refreshList,
                              child: GridView.count(
                                primary: false,
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context).size.height / 1300,
                                children: <Widget>[

                                  if(productViewModel.searchProductList.isNotEmpty)
                                    for (int i = 0; i < productViewModel.searchProductList.length; i++)
                                      InkWell(
                                        onTap: (){
                                          productDetailViewModel.setColorCode(productViewModel.searchProductList[i].color_code!);
                                          productDetailViewModel.selectedColor(1);
                                          productViewModel.selectedColor(productViewModel.searchProductList[i].color!);
                                          productViewModel.getProductDetailsVm(
                                            productViewModel.searchProductList[i].productId!,
                                            productViewModel.searchProductList[i].color!,
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

                                                  productViewModel.searchProductList[i].product!.image==""
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
                                                            image: NetworkImage(productViewModel.searchProductList[i].product!.image!),
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

                                                            if(productViewModel.searchProductList[i].product!.name!.length > 18)
                                                              Text(productViewModel.searchProductList[i].product!.name! == ""?
                                                              "" :productViewModel.searchProductList[i].product!.name!.substring(0,18),
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: AllDimension.twelve
                                                                ),)
                                                            else
                                                              Text(productViewModel.searchProductList[i].product!.name! == ""?
                                                              "" :productViewModel.searchProductList[i].product!.name!,
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
                                                                      color: HexColor(productViewModel.searchProductList[i].color_code!),
                                                                      borderRadius: BorderRadius.circular(100)
                                                                  ),
                                                                ),

                                                                SizedBox(width: AllDimension.four),

                                                                Text(productViewModel.searchProductList[i].availableColor! == ""?
                                                                "" :"+${productViewModel.searchProductList[i].availableColor.toString()}")

                                                              ],
                                                            )

                                                          ],
                                                        ),

                                                        SizedBox(height: AllDimension.four),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[

                                                            Text(productViewModel.searchProductList[i].product!.totalQuantity! == ""?
                                                            "" :"QTY-"+productViewModel.searchProductList[i].product!.totalQuantity.toString(),
                                                              style: TextStyle(
                                                                  fontSize: AllDimension.twelve
                                                              ),),
                                                            Text("${productViewModel.searchProductList[i].product!.price! == ""?
                                                            "" :"₹"+productViewModel.searchProductList[i].product!.price.toString()}",
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

                                            if(productViewModel.searchProductList[i].set! == "Cut Set")
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
                              ),
                            ),
                          )
                      )
                    else if(productViewModel.isProductAvailable.value == 2)
                      Expanded(
                        child: Center(
                          child: Text("No products!",
                            style: TextStyle(fontSize: AllDimension.thirtyTwo,
                                fontWeight: FontWeight.bold),),
                        ),
                      )
                    else
                      Expanded(
                        child: Center(
                          child: Text("Search products!",
                            style: TextStyle(fontSize: AllDimension.thirtyTwo,
                                fontWeight: FontWeight.bold),),
                        ),
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
          )
          ),
        )
    );
  }
}
