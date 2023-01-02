import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/ProductList.dart';
import 'package:moon_walker/view_model/ProductDetailsViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';

class ProductComponents {

  static Widget sizeWidgetArea(BuildContext context) {
    final productViewModel = Get.put(ProductViewModel());
    return Obx(()=>Container(
        padding: EdgeInsets.only(
          left: AllDimension.twelve,
          right: AllDimension.twelve,
        ),
        decoration: BoxDecoration(color: AllColors.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Divider(),
            Container(
                height: 30,
                margin: EdgeInsets.only(
                  top: AllDimension.four,
                  bottom: AllDimension.four,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Expanded(
                      flex:2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ProductList.sizeList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                right: AllDimension.eight,
                                top: AllDimension.eight,
                              ),
                              child: Text(
                                ProductList.sizeList[index],
                                style: TextStyle(fontSize: AllDimension.eighteen,
                                    color: AllColors.greyColor),
                              ),
                            );
                          }),
                    ),

                    // if(productViewModel.productDetail.isNotEmpty)
                    //   Text("₹${productViewModel.productDetail[0].price}",
                    //     style: TextStyle(
                    //         fontSize: AllDimension.twenty,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   )else
                    //   Text("₹0",
                    //     style: TextStyle(
                    //         fontSize: AllDimension.twenty,
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   )

                    if(productViewModel.productDetail.isNotEmpty)
                      Expanded(
                          flex:1,
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Text("Qty, ${productViewModel.productDetail[0].quantity}",
                                  style: TextStyle(fontSize: AllDimension.eighteen)))
                      )else
                      Expanded(
                          flex:1,
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Text("Qty, 0",
                                  style: TextStyle(fontSize: AllDimension.eighteen)))
                      )

                  ],
                )
            ),
            Divider(),

          ],
        )));
  }

  static Widget colorsWidgetArea(
      BuildContext context, String title, Color color) {

    final productDetailsViewModel = Get.put(ProductDetailsViewModel());
    final productViewModel = Get.put(ProductViewModel());

    return Obx(()=>Container(
        margin: EdgeInsets.only(bottom: AllDimension.eight),
        padding: EdgeInsets.all(AllDimension.twelve),
        decoration: BoxDecoration(color: color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            title == "" ? SizedBox.shrink() : Text(title,
              style: TextStyle(
                  fontSize: AllDimension.sixteen,
                  fontWeight: FontWeight.bold
              ),),

            SizedBox(height: AllDimension.eight),

            SizedBox(
                height: AllDimension.oneTen,
                child: GridView.count(
                  primary: false,
                  crossAxisCount: 5,
                  crossAxisSpacing: 24,
                  childAspectRatio: MediaQuery.of(context).size.width / 380,
                  children: <Widget>[

                    for (int i = 0; i < productViewModel.productDetailColors.length; i++)

                      InkWell(
                        onTap: (){
                          productDetailsViewModel.setColorCode(productViewModel.productDetailColors[i].color_code!);
                          productDetailsViewModel.onSelectColor(i);
                          productViewModel.setSelectedColor(productViewModel.productDetailColors[i].color!);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[

                            productViewModel.productDetailColors[i].color_code==""?
                                Image.network(productViewModel.productDetailColors[i].color_image!):
                            Container(
                              margin: EdgeInsets.only(
                                right: AllDimension.eight,
                                top: AllDimension.eight,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor(productViewModel.productDetailColors[i].color_code!),
                                border: Border.all(
                                    color: productDetailsViewModel.selectedColor.value==i?
                                    AllColors.greyColor!: AllColors.transparent,
                                    width: 4// border color
                                ),
                                borderRadius: BorderRadius.circular(
                                    AllDimension.oneHundred
                                ),
                              ),
                            ),

                            Positioned(
                                left: AllDimension.eight,
                                right:AllDimension.sixteen,
                                top:AllDimension.twenty,
                                child: productViewModel.selectedColor.value.toString()!=
                                    productViewModel.productDetailColors[i].color!.toString()?
                                const SizedBox.shrink():
                                Container(
                                  alignment: Alignment.center,
                                  height: AllDimension.twentyFour,
                                  width: AllDimension.twentyFour,
                                  child: Image.asset(AllImages.tick),
                                )
                            )

                          ],
                        ),
                      ),

                    productViewModel.productDetailColors.length>9?
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        right: AllDimension.eight,
                        top: AllDimension.eight,
                      ),
                      decoration: BoxDecoration(
                          color: AllColors.greyLiColor,
                          borderRadius:
                          BorderRadius.circular(AllDimension.oneHundred)),
                      child: Text("+12",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ):
                    SizedBox.shrink()

                  ],
                )),
          ],
        )));
  }

  static Widget productNameAndBanner(BuildContext context) {

    final productViewModel = Get.put(ProductViewModel());

    return Obx(()=>
        Container(
      decoration: BoxDecoration(color: AllColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Column(
            children: <Widget>[

              if(productViewModel.productDetailImages.isNotEmpty)
                SizedBox(
                  height: AllDimension.fourHundredThirty,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    dotSize: 4,
                    autoplay: true,
                    animationDuration: Duration(seconds: 1),
                    dotBgColor: AllColors.transparent,
                    images: [

                      // productViewModel.searchProductList[i].product!.image==""
                      //     ?Container(
                      //   height: AllDimension.twoTwenty,
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           image: AssetImage(AllImages.shirt),
                      //           fit: BoxFit.cover
                      //       )
                      //   ),
                      // ):
                      // Container(
                      //   height: AllDimension.twoTwenty,
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           image: NetworkImage(productViewModel.searchProductList[i].product!.image!),
                      //           fit: BoxFit.cover
                      //       )
                      //   ),
                      // ),

                      if(productViewModel.productDetailImages.length>5)
                        for(int i = 0; i<5; i++)
                          NetworkImage(productViewModel.productDetailImages[i])
                      else
                        for(int i = 0; i<productViewModel.productDetailImages.length; i++)
                          NetworkImage(productViewModel.productDetailImages[i])
                    ],
                  ),
                )else
                SizedBox(
                  height: AllDimension.fourHundredThirty,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    dotSize: 4,
                    autoplay: true,
                    animationDuration: Duration(seconds: 1),
                    dotBgColor: AllColors.transparent,
                    images: [
                      ExactAssetImage(AllImages.shirt)
                    ],
                  ),
                ),

            ],
          ),

          if(productViewModel.productDetail.isNotEmpty)
          Container(
              padding: EdgeInsets.all(AllDimension.twelve),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Text(
                        "Style",
                        style: TextStyle(
                            fontSize: AllDimension.twenty
                        ),
                      ),
                      SizedBox(width: AllDimension.four),
                      Text(
                        "${productViewModel.productDetail[0].articleNo??""}",
                        style: TextStyle(
                            fontSize: AllDimension.twenty,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  if(productViewModel.productDetail.isNotEmpty)
                  Text("₹${productViewModel.productDetail[0].price??""}",
                    style: TextStyle(
                        fontSize: AllDimension.twenty,
                        fontWeight: FontWeight.bold
                    ),
                  )else
                    Text("₹0",
                      style: TextStyle(
                          fontSize: AllDimension.twenty,
                          fontWeight: FontWeight.bold
                      ),
                    )

                ],
              )
          )
        ],
      ),
    ));
  }

  static displaySortBottomPopup(context) async {

    final productDetailsViewModel = Get.put(ProductDetailsViewModel());
    final productViewModel = Get.put(ProductViewModel());

    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(AllDimension.twenty)),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Obx(()=> SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Row(
                        children: <Widget>[

                          Container(
                            height: AllDimension.thirtyTwo,
                            width: AllDimension.thirtyTwo,
                            margin: EdgeInsets.only(
                                right: AllDimension.eight,
                                top: AllDimension.eight,
                                left: AllDimension.sixteen
                            ),
                            decoration: BoxDecoration(
                              color: HexColor(productDetailsViewModel.colorCode.value),
                              border: Border.all(
                                  color: AllColors.greyColor!,
                                  width: 4// border color
                              ),
                              borderRadius: BorderRadius.circular(
                                  AllDimension.oneHundred
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                top: AllDimension.twenty,
                                bottom: AllDimension.twelve,
                                right: AllDimension.eight
                            ),
                            child: Text("${productViewModel.productDetail[0].articleNo??""}",
                                style: TextStyle(
                                    fontSize: AllDimension.twenty)),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                top: AllDimension.twenty,
                                bottom: AllDimension.twelve,
                                right: AllDimension.sixteen),
                            child: Text(
                                productViewModel.selectedColor.value.length>8?
                                "${productViewModel.selectedColor.value.substring(0,8)}..."
                                    :productViewModel.selectedColor.value,
                                style: TextStyle(
                                    fontSize: AllDimension.eighteen,
                                    fontWeight: FontWeight.bold)),
                          ),

                        ],
                      ),

                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(AllDimension.eight),
                          child: Image.asset(AllImages.changeColor,
                              height: AllDimension.fifty),
                        ),
                      ),

                    ],
                  ),

                  Divider(),

                  SizedBox(height: AllDimension.eight),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.only(
                            top: AllDimension.eight,
                            bottom: AllDimension.eight,
                            left: AllDimension.sixteen,
                            right: AllDimension.sixteen),
                        child: Text("Select Size Set",
                            style: TextStyle(
                                fontSize: AllDimension.eighteen,
                                fontWeight: FontWeight.bold)),
                      ),

                      Container(
                          margin: EdgeInsets.only(
                              top: AllDimension.eight,
                              bottom: AllDimension.eight,
                              left: AllDimension.sixteen,
                              right: AllDimension.sixteen),
                          child: Text("Size | Available Qty",
                              style: TextStyle(
                                  fontSize: AllDimension.sixteen,
                                  color: AllColors.greyColor))
                      )

                    ],
                  ),

                  SizedBox(height: AllDimension.sixteen),

                  //set A
                  if(productViewModel.setAList.isNotEmpty)
                  InkWell(
                    onTap: (){
                      productViewModel.setSizeSet("1");
                    },
                    child: Column(
                        children: <Widget>[

                          Row(
                            children: <Widget>[

                              Container(
                                height: AllDimension.twentyEight,
                                width: AllDimension.twentyEight,
                                margin: EdgeInsets.only(
                                  left: AllDimension.twelve,
                                  right: AllDimension.twelve,
                                  bottom: AllDimension.four,
                                  top: AllDimension.four,
                                ),
                                decoration: BoxDecoration(
                                  color: productViewModel.isFashionSelectedList.contains("1")?
                                  AllColors.greenColor:AllColors.whiteColor,
                                  border: Border.all(
                                      color: AllColors.greyColor!,
                                      width: 2// border color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      AllDimension.oneHundred),
                                ),
                              ),

                              Expanded(
                                child: SizedBox(
                                  height: AllDimension.fourty,
                                  child: ListView.builder(
                                      itemCount: productViewModel.setAList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index){
                                        return Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            left: AllDimension.sixteen,
                                            right: AllDimension.sixteen,
                                            top: AllDimension.six,
                                            bottom: AllDimension.six,
                                          ),
                                          margin: EdgeInsets.all(AllDimension.two),
                                          decoration: BoxDecoration(
                                            color: productViewModel.setAList[index].quantity == 0?
                                            AllColors.lightRedColor:
                                            AllColors.whiteColor,
                                            border: Border.all(
                                              color: productViewModel.setAList[index].quantity == 0?
                                              AllColors.redColorDark:
                                              AllColors.greyColor!,// border color
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                AllDimension.twelve
                                            ),
                                          ),
                                          child: Row(
                                            children: <Widget>[

                                              Text("${productViewModel.setAList[index].size} |",style: TextStyle(
                                                  color:AllColors.blackColor,
                                                  fontSize: AllDimension.eighteen,
                                                  fontWeight: FontWeight.bold)),
                                              SizedBox(width: AllDimension.four),
                                              Text("${productViewModel.setAList[index].quantity}",style: TextStyle(
                                                  color:AllColors.blackColor,
                                                  fontSize: AllDimension.eighteen))


                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: AllDimension.twelve),

                        ],
                      ),
                  ),

                  //set B
                  if(productViewModel.setBList.isNotEmpty)
                  InkWell(
                    onTap: (){
                      productViewModel.setSizeSet("2");
                      if(productViewModel.productFashionSizes.contains("Set B")){
                        productViewModel.productFashionSizes.remove("Set B");
                      }else{
                        productViewModel.productFashionSizes.add("Set B");
                      }
                      print(productViewModel.productFashionSizes);
                    },
                    child: Column(
                      children: <Widget>[

                        Row(
                          children: <Widget>[

                            Container(
                              height: AllDimension.twentyEight,
                              width: AllDimension.twentyEight,
                              margin: EdgeInsets.only(
                                left: AllDimension.twelve,
                                right: AllDimension.twelve,
                                bottom: AllDimension.four,
                                top: AllDimension.four,
                              ),
                              decoration: BoxDecoration(
                                color: productViewModel.isFashionSelectedList.value.contains("2")?
                                AllColors.greenColor:AllColors.whiteColor,
                                border: Border.all(
                                    color: AllColors.greyColor!,
                                    width: 2// border color
                                ),
                                borderRadius: BorderRadius.circular(
                                    AllDimension.oneHundred),
                              ),
                            ),

                            Expanded(
                              child: SizedBox(
                                height: AllDimension.fourty,
                                child: ListView.builder(
                                    itemCount: productViewModel.setBList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      return Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                          left: AllDimension.sixteen,
                                          right: AllDimension.sixteen,
                                          top: AllDimension.six,
                                          bottom: AllDimension.six,
                                        ),
                                        margin: EdgeInsets.all(AllDimension.two),
                                        decoration: BoxDecoration(
                                          color: productViewModel.setBList[index].quantity == 0?
                                          AllColors.lightRedColor:
                                          AllColors.whiteColor,
                                          border: Border.all(
                                            color: productViewModel.setBList[index].quantity == 0?
                                            AllColors.redColorDark:
                                            AllColors.greyColor!, // border color
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              AllDimension.twelve
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[

                                            Text("${productViewModel.setBList[index].size} |",style: TextStyle(
                                                color:AllColors.blackColor,
                                                fontSize: AllDimension.eighteen,
                                                fontWeight: FontWeight.bold)),
                                            SizedBox(width: AllDimension.four),
                                            Text("${productViewModel.setBList[index].quantity}",style: TextStyle(
                                                color:AllColors.blackColor,
                                                fontSize: AllDimension.eighteen))


                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: AllDimension.twelve),

                      ],
                    ),
                  ),

                  //set C
                  if(productViewModel.setCList.isNotEmpty)
                  InkWell(
                    onTap: (){
                      productViewModel.setSizeSet("3");
                      if(productViewModel.productFashionSizes.contains("Set C")){
                        productViewModel.productFashionSizes.remove("Set C");
                      }else{
                        productViewModel.productFashionSizes.add("Set C");
                      }
                      print(productViewModel.productFashionSizes);
                    },
                    child: Column(
                      children: <Widget>[

                        Row(
                          children: <Widget>[

                            Container(
                              height: AllDimension.twentyEight,
                              width: AllDimension.twentyEight,
                              margin: EdgeInsets.only(
                                left: AllDimension.twelve,
                                right: AllDimension.twelve,
                                bottom: AllDimension.four,
                                top: AllDimension.four,
                              ),
                              decoration: BoxDecoration(
                                color: productViewModel.isFashionSelectedList.contains("3")?
                                AllColors.greenColor:AllColors.whiteColor,
                                border: Border.all(
                                    color: AllColors.greyColor!,
                                    width: 2// border color
                                ),
                                borderRadius: BorderRadius.circular(
                                    AllDimension.oneHundred),
                              ),
                            ),

                            Expanded(
                              child: SizedBox(
                                height: AllDimension.fourty,
                                child: ListView.builder(
                                    itemCount: productViewModel.setCList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      return Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                          left: AllDimension.sixteen,
                                          right: AllDimension.sixteen,
                                          top: AllDimension.six,
                                          bottom: AllDimension.six,
                                        ),
                                        margin: EdgeInsets.all(AllDimension.two),
                                        decoration: BoxDecoration(
                                          color: productViewModel.setCList[index].quantity == 0?
                                          AllColors.lightRedColor:
                                          AllColors.whiteColor,
                                          border: Border.all(
                                            color: productViewModel.setCList[index].quantity == 0?
                                                AllColors.redColorDark:
                                            AllColors.greyColor!, // border color
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              AllDimension.twelve
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[

                                            Text("${productViewModel.setCList[index].size} |",style: TextStyle(
                                                color:AllColors.blackColor,
                                                fontSize: AllDimension.eighteen,
                                                fontWeight: FontWeight.bold)),
                                            SizedBox(width: AllDimension.four),
                                            Text("${productViewModel.setCList[index].quantity}",style: TextStyle(
                                                color:AllColors.blackColor,
                                                fontSize: AllDimension.eighteen))

                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: AllDimension.twelve),

                      ],
                    ),
                  ),

                  if(productViewModel.isFashionSelectedList.isNotEmpty)
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: AllDimension.sixteen,
                      right: AllDimension.sixteen,
                      top: AllDimension.eight,
                      bottom: AllDimension.eight,
                    ),
                    margin: EdgeInsets.all(AllDimension.eight),
                    decoration: BoxDecoration(
                      color: AllColors.lightGreyColor,
                      border: Border.all(
                        color: AllColors.greyColor!, // border color
                      ),
                      borderRadius: BorderRadius.circular(
                          AllDimension.twelve
                      ),
                    ),
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: AllDimension.twenty,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[

                              Text("Qty added:",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),

                              SizedBox(width: AllDimension.twenty),

                              Text("S : ${productViewModel.S.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("M : ${productViewModel.M.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("L : ${productViewModel.L.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("XL : ${productViewModel.XL.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("2XL : ${productViewModel.TWOXL.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("3XL : ${productViewModel.THREEXL.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("4XL : ${productViewModel.FOURXL.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),
                              SizedBox(width: AllDimension.twenty),

                              Text("5XL : ${productViewModel.FIVEXL.value}",
                                  style: TextStyle(fontSize: AllDimension.sixteen)),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  //
                  Container(
                    margin: EdgeInsets.only(
                        left: AllDimension.sixteen,
                        right: AllDimension.sixteen,
                        top: AllDimension.twenty
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Container(
                            padding: EdgeInsets.only(
                              left: AllDimension.twenty,
                              right: AllDimension.twenty,
                              top:AllDimension.twelve,
                              bottom:AllDimension.twelve,
                            ),
                            decoration: BoxDecoration(
                              color: AllColors.mainGreyColor,
                              border: Border.all(
                                  color: AllColors.blackColor // border color
                              ),
                              borderRadius: BorderRadius.circular(
                                  AllDimension.twelve
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                InkWell(
                                  onTap:(){
                                    productViewModel.removeQuantityCounter();
                                  },
                                  child: Icon(Icons.remove,
                                      size: AllDimension.eighteen),
                                ),

                                Container(
                                    margin: EdgeInsets.only(
                                      left: AllDimension.sixteen,
                                      right: AllDimension.sixteen,
                                    ),
                                    child: Text(productViewModel.myQtyCounterValue.value.toString(),
                                      style: TextStyle(fontSize: AllDimension.eighteen,
                                          fontWeight: FontWeight.bold),)
                                ),

                                InkWell(
                                  onTap: (){
                                    productViewModel.addQuantityCounter();
                                  },
                                  child: Icon(Icons.add,
                                      size: AllDimension.eighteen),
                                ),

                              ],
                            )
                        ),

                        InkWell(
                          onTap: (){
                            if(productViewModel.productFashionSizes.isNotEmpty){
                              productViewModel.addFashionCart();
                            }else{
                              GlobalEquipments.SnackToastFailed("My Cart", "Please add sizes to proceed.");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: AllDimension.fortyEight,
                              right: AllDimension.fortyEight,
                              top:AllDimension.twelve,
                              bottom:AllDimension.twelve,
                            ),
                            decoration: BoxDecoration(
                                color: AllColors.blueColorLight, //background color
                                border: Border.all(
                                    color: AllColors.blueColorLight! // border color
                                ),
                                borderRadius: BorderRadius.circular(
                                    AllDimension.four
                                )
                            ),
                            child: Text("ADD TO CART",
                                style: TextStyle(
                                    color: AllColors.whiteColor,
                                    fontSize: AllDimension.eighteen,
                                    fontWeight: FontWeight.bold)
                            ),
                          ),
                        )

                      ],
                    ),
                  ),

                  SizedBox(height: AllDimension.sixteen)

                ],
              ),
            ));
          });
        });
  }


  static displayCoreBottomPopup(context) async {

    final productViewModel = Get.put(ProductViewModel());

    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(AllDimension.twenty)),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Obx(()=>
               Stack(
                 children: <Widget>[

                   Container(
                     margin: EdgeInsets.only(bottom: AllDimension.eightyFour),
                     child: SingleChildScrollView(
                       child: Container(
                         margin: EdgeInsets.all(AllDimension.eight),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             SizedBox(height: AllDimension.eight),

                             Container(
                               margin: EdgeInsets.only(
                                   top: AllDimension.eight,
                                   bottom: AllDimension.eight,
                                   left: AllDimension.sixteen,
                                   right: AllDimension.sixteen),
                               child: Text("Select Size Set",
                                   style: TextStyle(
                                       fontSize: AllDimension.eighteen,
                                       fontWeight: FontWeight.bold)),
                             ),

                             SizedBox(height: AllDimension.sixteen),

                             Column(
                               children: <Widget>[

                                 InkWell(
                                   onTap: (){
                                     productViewModel.selectAllCoreSizes();
                                   },
                                   child: Row(
                                     children: <Widget>[

                                       Container(
                                         height: AllDimension.twentyEight,
                                         width: AllDimension.twentyEight,
                                         margin: EdgeInsets.only(
                                           left: AllDimension.twelve,
                                           right: AllDimension.twelve,
                                           bottom: AllDimension.four,
                                           top: AllDimension.four,
                                         ),
                                         decoration: BoxDecoration(
                                           color: productViewModel.isSelectedSelectAllBtn.value == true? AllColors.greenColor
                                           :AllColors.whiteColor,
                                           border: Border.all(
                                               color: AllColors.greyColor!,
                                               width: 2// border color
                                           ),
                                           borderRadius: BorderRadius.circular(
                                               AllDimension.oneHundred),
                                         ),
                                       ),

                                       Text("SELECT ALL",
                                           style: TextStyle(fontSize: AllDimension.sixteen,
                                               color: AllColors.greyColor)),

                                       Expanded(
                                         child: Container(
                                           margin: EdgeInsets.only(right: AllDimension.twenty),
                                           alignment: Alignment.centerRight,
                                           child: Image.asset(AllImages.horizontalColorImage,
                                             height: AllDimension.twentyFour,),
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 SizedBox(height: AllDimension.twelve),


                                 if(productViewModel.productDetailSizes.isNotEmpty)
                                 for(int i = 0; i<productViewModel.productDetailSizes.length; i++)

                                   InkWell(
                                     onTap: (){
                                       productViewModel.addCoreSize(productViewModel.productDetailSizes[i]);
                                     },
                                     child: Column(
                                       children: <Widget>[

                                         Row(
                                           children: <Widget>[

                                             Container(
                                               height: AllDimension.twentyEight,
                                               width: AllDimension.twentyEight,
                                               margin: EdgeInsets.only(
                                                 left: AllDimension.twelve,
                                                 right: AllDimension.twelve,
                                                 bottom: AllDimension.four,
                                                 top: AllDimension.four,
                                               ),
                                               decoration: BoxDecoration(
                                                   color: productViewModel.productCoreSizes
                                                       .contains(productViewModel.productDetailSizes[i])?
                                                   AllColors.greenColor:AllColors.whiteColor,
                                                 border: Border.all(
                                                     color: AllColors.greyColor!,
                                                     width: AllDimension.two// border color
                                                 ),
                                                 borderRadius: BorderRadius.circular(
                                                     AllDimension.oneHundred),
                                               ),
                                             ),

                                             SizedBox(
                                                 height: AllDimension.fourty,
                                                 child: Container(
                                                   alignment: Alignment.center,
                                                   padding: EdgeInsets.only(
                                                     left: AllDimension.sixteen,
                                                     right: AllDimension.sixteen,
                                                     top: AllDimension.six,
                                                     bottom: AllDimension.six,
                                                   ),
                                                   margin: EdgeInsets.all(AllDimension.two),
                                                   decoration: BoxDecoration(
                                                     color: productViewModel.productDetailSizes[i].total_quantity=='0'?
                                                     AllColors.lightRedColor:
                                                     AllColors.whiteColor,
                                                     border: Border.all(
                                                       color: AllColors.greyColor!, // border color
                                                     ),
                                                     borderRadius: BorderRadius.circular(
                                                         AllDimension.twelve
                                                     ),
                                                   ),
                                                   child: Row(
                                                     children: <Widget>[

                                                       Text("${productViewModel.productDetailSizes[i].size} |",style: TextStyle(
                                                           color:AllColors.blackColor,
                                                           fontSize: AllDimension.eighteen,
                                                           fontWeight: FontWeight.bold)),
                                                       SizedBox(width: AllDimension.four),
                                                       Text("${productViewModel.productDetailSizes[i].total_quantity}",style: TextStyle(
                                                           color:AllColors.blackColor,
                                                           fontSize: AllDimension.eighteen))


                                                     ],
                                                   ),
                                                 )
                                             ),

                                             Expanded(
                                               child: Container(
                                                 margin: EdgeInsets.only(right: AllDimension.sixteen),
                                                 alignment: Alignment.centerRight,
                                                 child: Image.asset(AllImages.horizontalColorImage,
                                                   height: AllDimension.twentyFour,),
                                               ),
                                             )

                                           ],
                                         ),
                                         SizedBox(height: AllDimension.twelve),

                                       ],
                                     ),
                                   )

                               ],
                             ),

                             //

                             SizedBox(height: AllDimension.sixteen)

                           ],
                         ),
                       ),
                     ),
                   ),

                   Positioned(
                       left: 0,
                       right:0,
                       bottom:AllDimension.eight,
                       child: Column(
                         children: <Widget>[

                           Container(
                             margin: EdgeInsets.only(
                               left: AllDimension.sixteen,
                               right: AllDimension.sixteen,
                             ),
                             alignment: Alignment.center,
                             padding: EdgeInsets.only(
                               left: AllDimension.sixteen,
                               right: AllDimension.sixteen,
                               top: AllDimension.eight,
                               bottom: AllDimension.eight,
                             ),
                             decoration: BoxDecoration(
                               color: AllColors.lightGreyColor,
                               border: Border.all(
                                 color: AllColors.greyColor!, // border color
                               ),
                               borderRadius: BorderRadius.circular(
                                   AllDimension.twelve
                               ),
                             ),
                             child: Column(
                               children: <Widget>[

                                 SizedBox(
                                   height:AllDimension.twenty,
                                   child: ListView(
                                     scrollDirection: Axis.horizontal,
                                     children: <Widget>[


                                       Text("Qty added:",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),

                                       SizedBox(width: AllDimension.twenty),

                                       Text("S : ${productViewModel.S1.value * productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("M : ${productViewModel.M1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("L : ${productViewModel.L1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("XL : ${productViewModel.XL1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("2XL : ${productViewModel.TWOXL1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("3XL : ${productViewModel.THREEXL1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("4XL : ${productViewModel.FOURXL1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),
                                       SizedBox(width: AllDimension.twenty),

                                       Text("5XL : ${productViewModel.FIVEXL1.value *productViewModel.myCoreQtyCounterValue.value}",
                                           style: TextStyle(fontSize: AllDimension.sixteen)),

                                     ],
                                   ),
                                 )

                                 // Row(
                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 //   children: <Widget>[
                                 //
                                 //     Text("Qty added:",
                                 //         style: TextStyle(fontSize: AllDimension.sixteen)),
                                 //
                                 //     Text("S : ${productViewModel.myCoreQtyCounterValue.value}",
                                 //         style: TextStyle(fontSize: AllDimension.sixteen)),
                                 //
                                 //     Text("M : ${productViewModel.myCoreQtyCounterValue.value}",
                                 //         style: TextStyle(fontSize: AllDimension.sixteen)),
                                 //
                                 //     Text("L : ${productViewModel.myCoreQtyCounterValue.value}",
                                 //         style: TextStyle(fontSize: AllDimension.sixteen)),
                                 //
                                 //     Text("XL : ${productViewModel.myCoreQtyCounterValue.value}",
                                 //         style: TextStyle(fontSize: AllDimension.sixteen)),
                                 //
                                 //
                                 //   ],
                                 // )

                               ],
                             ),
                           ),

                           Container(
                             margin: EdgeInsets.only(
                                 left: AllDimension.sixteen,
                                 right: AllDimension.sixteen,
                                 top: AllDimension.eight
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[

                                 Container(
                                     padding: EdgeInsets.only(
                                       left: AllDimension.twenty,
                                       right: AllDimension.twenty,
                                       top:AllDimension.twelve,
                                       bottom:AllDimension.twelve,
                                     ),
                                     decoration: BoxDecoration(
                                       color: AllColors.mainGreyColor,
                                       border: Border.all(
                                           color: AllColors.blackColor // border color
                                       ),
                                       borderRadius: BorderRadius.circular(
                                           AllDimension.twelve
                                       ),
                                     ),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: <Widget>[

                                         InkWell(
                                           onTap:(){
                                             productViewModel.removeCoreQuantityCounter();
                                           },
                                           child: Icon(Icons.remove,
                                               size: AllDimension.eighteen),
                                         ),

                                         Container(
                                             margin: EdgeInsets.only(
                                               left: AllDimension.sixteen,
                                               right: AllDimension.sixteen,
                                             ),
                                             child: Text(productViewModel.myCoreQtyCounterValue.value.toString(),
                                               style: TextStyle(fontSize: AllDimension.eighteen,
                                                   fontWeight: FontWeight.bold),)
                                         ),

                                         InkWell(
                                           onTap: (){
                                             productViewModel.addCoreQuantityCounter();
                                           },
                                           child: Icon(Icons.add,
                                               size: AllDimension.eighteen),
                                         ),

                                       ],
                                     )
                                 ),

                                 InkWell(
                                   onTap: (){
                                     productViewModel.clearAllDataOfSizes();
                                     if(productViewModel.productCoreSizes.isNotEmpty){
                                       productViewModel.addCoreCart();
                                     }else{
                                       GlobalEquipments.SnackToastFailed("Size Set", "Please select size set to continue.");
                                     }
                                   },
                                   child: Container(
                                     padding: EdgeInsets.only(
                                       left: AllDimension.fortyEight,
                                       right: AllDimension.fortyEight,
                                       top:AllDimension.twelve,
                                       bottom:AllDimension.twelve,
                                     ),
                                     decoration: BoxDecoration(
                                         color: AllColors.blueColorLight, //background color
                                         border: Border.all(
                                             color: AllColors.blueColorLight! // border color
                                         ),
                                         borderRadius: BorderRadius.circular(
                                             AllDimension.four
                                         )
                                     ),
                                     child: Text("ADD TO CART",
                                         style: TextStyle(
                                             color: AllColors.whiteColor,
                                             fontSize: AllDimension.eighteen,
                                             fontWeight: FontWeight.bold)
                                     ),
                                   ),
                                 )

                               ],
                             ),
                           )

                         ],
                       ),
                   )

                 ],
               )
            );
          });
        });
  }

}
