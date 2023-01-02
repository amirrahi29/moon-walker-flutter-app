import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/ProductComponents.dart';
import 'package:moon_walker/view_model/ProductDetailsViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  var productId = Get.arguments;
  final productViewModel = Get.put(ProductViewModel());
  final productDetailsViewModel = Get.put(ProductDetailsViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(()=>LoadingOverlayPro(
              isLoading: productViewModel.isProductLoader.value,
              child: Container(
                  height: AllDimension.infinity,
                  width: AllDimension.infinity,
                  color: AllColors.whiteColor,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      ListView(
                        children: <Widget>[

                          ProductComponents.productNameAndBanner(context),

                          ProductComponents.sizeWidgetArea(context),

                          ProductComponents.colorsWidgetArea(context,"Available Colors",AllColors.whiteColor),

                        ],
                      ),

                      Positioned(
                          top: AllDimension.eight,
                          left: AllDimension.eight,
                          child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.all(AllDimension.twelve),
                              child: Image.asset(AllImages.backBtn,
                                  color: AllColors.blackColor,
                                  height: AllDimension.twenty),
                            ),
                          )),
                      Positioned(
                          top: AllDimension.eight,
                          right: AllDimension.eight,
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(RoutesGetters.getScanRoute());
                            },
                            child: Container(
                              padding: EdgeInsets.all(AllDimension.twelve),
                              decoration: BoxDecoration(
                                  color: AllColors.blueColorLight,
                                  borderRadius: BorderRadius.circular(
                                      AllDimension.oneHundred)),
                              child: Image.asset(AllImages.scanner,
                                  color: AllColors.whiteColor,
                                  height: AllDimension.twenty),
                            ),
                          )),
                      Positioned(
                          top: AllDimension.sixty,
                          right: AllDimension.eight,
                          child: InkWell(
                            onTap: (){
                              productViewModel.addWishlist();
                            },
                            child: Container(
                              padding: EdgeInsets.all(AllDimension.twelve),
                              decoration: BoxDecoration(
                                  color: AllColors.blueColorLight,
                                  borderRadius: BorderRadius.circular(
                                      AllDimension.oneHundred)),
                              child: Image.asset(AllImages.wishlist,
                                  color: AllColors.whiteColor,
                                  height: AllDimension.twenty),
                            ),
                          )),
                      //add to cart button
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: InkWell(
                            onTap: (){
                              productViewModel.clearAllDataOfSizes();
                              productViewModel.productCoreSizes.clear();
                              productViewModel.isFashionSelectedList.clear();
                              productViewModel.myCoreQtyCounterValue.value = 1;
                              if(productViewModel.categoryIdForWishlist.value == "1"){
                                if(productDetailsViewModel.selectedColor.value != 200){
                                  productViewModel.productFashionSizes.clear();
                                  productViewModel.getSizePopUpDetails(context);
                                } else{
                                  GlobalEquipments.SnackToastFailed("Choose Color", "Please select atleast one color to proceed!");
                                }
                              }else{
                                productViewModel.isSelectedSelectAllBtn.value = false;
                                ProductComponents.displayCoreBottomPopup(context);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                left: AllDimension.twentyFour,
                                right: AllDimension.twentyFour,
                                top: AllDimension.sixteen,
                                bottom: AllDimension.sixteen,
                              ),
                              margin: EdgeInsets.all(AllDimension.eight),
                              decoration: BoxDecoration(
                                  color: AllColors.bannerFirstColor,
                                  borderRadius:
                                  BorderRadius.circular(AllDimension.four)),
                              child: Text(
                                "SELECT SET SIZE",
                                style: TextStyle(
                                    color: AllColors.whiteColor,
                                    fontSize: AllDimension.fourteen,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))

                    ],
                  )),
            ))
        ));
  }
}
