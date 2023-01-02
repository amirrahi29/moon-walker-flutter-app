import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/HomeListItems.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/DashboardViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';
import 'package:moon_walker/view_model/ProfileViewModel.dart';

class GlobalHomeComponents {

  static Widget CategorySection() {
    return Container(
      margin: EdgeInsets.only(
        top: AllDimension.twenty,
        bottom: AllDimension.eight,
        left: AllDimension.eight,
        right: AllDimension.eight,
      ),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < HomeListItems.homeCategoryList.length; i++)
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (i == 1) {
                      Get.toNamed(RoutesGetters.getRetailOrderRoute());
                    } else if (i == 2) {
                      Get.toNamed(RoutesGetters.getRetailRoute());
                    } else if (i == 3) {
                      Get.toNamed(RoutesGetters.getDistributorRoute());
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(AllDimension.eight),
                        padding: EdgeInsets.all(AllDimension.eight),
                        decoration: BoxDecoration(
                          color: AllColors.lightGreyColor,
                          borderRadius:
                              BorderRadius.circular(AllDimension.eight),
                        ),
                        child: HomeListItems.homeCategoryList[i]['icon'],
                      ),
                      Text(
                        HomeListItems.homeCategoryList[i]['title'],
                        style: TextStyle(
                            fontSize: AllDimension.sixteen,
                            color: AllColors.blackColor),
                      )
                    ],
                  ),
                )),
        ],
      ),
    );
  }

  static Widget BannerCarousal() {

    final dashViewModel = Get.put(DashboardViewModel());

    return Obx(() => Container(
      margin: EdgeInsets.only(
          top: AllDimension.sixteen,
          bottom: AllDimension.eight,
          left: AllDimension.eight,
          right: AllDimension.eight),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: AllDimension.twoHundred,
            width: AllDimension.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AllDimension.twelve),
              child: dashViewModel.sliderList.isNotEmpty?
              Carousel(
                dotSize: 5,
                autoplay: true,
                animationDuration: const Duration(seconds: 1),
                dotBgColor: AllColors.transparent,
                images: [
                  for(int i = 0; i<dashViewModel.sliderList.length; i++)
                    dashViewModel.sliderList[i].mobile_image! == ""?
                    Image.network(AllImages.shirt,
                      fit: BoxFit.cover,)
                        : Image.network(dashViewModel.sliderList[i].mobile_image!,
                      fit: BoxFit.cover,),
                ],
              ):Placeholders.bannerPlaceholder(),
            ),
          ),
        ],
      ),
    ));
  }

  static Widget offersDisplayCarousal() {
    CarouselController buttonCarouselController = CarouselController();
    List<Widget> items = [
      for (int i = 0; i < 10; i++)
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AllDimension.eight),
                image: DecorationImage(
                    image: AssetImage(AllImages.offer1), fit: BoxFit.cover)
            ),
          ),
        ),
    ];
    return Container(
      margin: EdgeInsets.only(top: 16, left: 8, right: 16),
      child: CarouselSlider(
        items: items,
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.4,
          aspectRatio: 2.0,
          initialPage: 2,
        ),
      ),
    );
  }

  static Widget salsBanner() {
    final dashboardViewModel = Get.put(DashboardViewModel());
    return Obx(()=>InkWell(
      onTap: () {
        Get.toNamed(RoutesGetters.getRetailOrderRoute());
      },
      child: Container(
        margin: EdgeInsets.only(
          top: AllDimension.twelve,
          bottom: AllDimension.four,
          left: AllDimension.eight,
          right: AllDimension.eight,
        ),
        height: AllDimension.oneHundred,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                AllDimension.eight
            ),
            image: DecorationImage(
                image: AssetImage(AllImages.salesBackground),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          margin: EdgeInsets.all(AllDimension.twenty),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "This month sale",
                style: TextStyle(
                    fontSize: AllDimension.twenty, color: AllColors.whiteColor),
              ),
              SizedBox(height: AllDimension.eight),

              SizedBox(
                width: AllDimension.infinity,
                height: AllDimension.twentyEight,
                child: dashboardViewModel.orderSumTotal.value == null?Text("0"):Text(
                  "₹${dashboardViewModel.orderSumTotal.value}/-",
                  style: TextStyle(
                      fontSize: AllDimension.twentyEight,
                      color: AllColors.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  static Widget categoryProductSection1(BuildContext context, String title) {

    final dashboardViewModel = Get.put(DashboardViewModel());
    final productViewModel = Get.put(ProductViewModel());

    int page = 0;

    return Obx(()=>Container(

      color: AllColors.lightGreyColor,
      child: Column(
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: AllDimension.twentyFour),
              Container(
                margin: EdgeInsets.only(left: AllDimension.eight),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: AllDimension.eighteen, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: AllDimension.twentyFour),

              if(dashboardViewModel.collectionList.isNotEmpty)
                Container(
                    color: AllColors.whiteColor,
                    height: 700,
                    child: Column(
                      children: <Widget>[
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.height / 1200,
                          children: <Widget>[
                            for (int i = 0; i < dashboardViewModel.collectionList.length; i++)

                              InkWell(
                                onTap: (){

                                  print(dashboardViewModel.collectionList[i].id!);
                                  productViewModel.setClearId();

                                  productViewModel.setCollectionId(
                                      dashboardViewModel.collectionList[i].id!,
                                      productViewModel.setId.value,
                                      productViewModel.sortId.value,
                                      productViewModel.search.value,
                                      productViewModel.brandId.value,
                                      page.toString()
                                  );

                                 productViewModel.pagingController.addPageRequestListener((pageKey) {
                                    page++;
                                    productViewModel.setCollectionId(
                                        dashboardViewModel.collectionList[i].id!,
                                        productViewModel.setId.value,
                                        productViewModel.sortId.value,
                                        productViewModel.search.value,
                                        productViewModel.brandId.value,
                                        page.toString()
                                    );
                                  });

                                  Get.toNamed(RoutesGetters.getFilterRoute(),
                                      arguments: dashboardViewModel.collectionList[i].name);

                                },
                                child: Container(
                                  margin: EdgeInsets.all(AllDimension.four),
                                  padding: EdgeInsets.all(AllDimension.four),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      dashboardViewModel.searchCollectionList[i].image! == ""
                                          ?Container(
                                        height: AllDimension.oneFifty,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(AllImages.shirt),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ):
                                      Container(
                                        height: AllDimension.oneFifty,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(dashboardViewModel.searchCollectionList[i].image!),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                      SizedBox(height: AllDimension.eight),

                                      if(dashboardViewModel.collectionList[i].name != null)
                                        Text(dashboardViewModel.collectionList[i].name!.length>15?
                                        "${dashboardViewModel.collectionList[i].name!.substring(0,15)}...":
                                        dashboardViewModel.collectionList[i].name!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: AllDimension.twelve),
                                        ),
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                        SizedBox(height: AllDimension.twentyFour),

                        InkWell(
                          onTap: (){
                            dashboardViewModel.setCategoryId(dashboardViewModel.categoryId.value);
                            Get.toNamed(RoutesGetters.getCollectionsRoute());
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: AllDimension.twentyFour,
                              right: AllDimension.twentyFour,
                              top: AllDimension.eight,
                              bottom: AllDimension.eight,
                            ),
                            decoration: BoxDecoration(
                                color: AllColors.redColorDark,
                                borderRadius: BorderRadius.circular(AllDimension.four)),
                            child: Text("VIEW ALL",
                                style: TextStyle(color: AllColors.whiteColor)),
                          ),
                        )
                      ],
                    ))
              else if(dashboardViewModel.collectionList.length>=9)
              Container(
                  color: AllColors.whiteColor,
                  height: 650,
                  child: Column(
                    children: <Widget>[
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 3,
                        childAspectRatio: MediaQuery.of(context).size.height / 1200,
                        children: <Widget>[
                          for (int i = 0; i < 9; i++)

                            InkWell(
                              onTap: (){
                                productViewModel.setClearId();
                                productViewModel.setCollectionId(
                                    dashboardViewModel.collectionList[i].id!,
                                  productViewModel.setId.value,
                                  productViewModel.sortId.value,
                                  productViewModel.search.value,
                                  productViewModel.brandId.value,
                                  "1"
                                );
                                Get.toNamed(RoutesGetters.getFilterRoute(),
                                    arguments: dashboardViewModel.collectionList[i].name);
                              },
                              child: Container(
                                margin: EdgeInsets.all(AllDimension.four),
                                padding: EdgeInsets.all(AllDimension.four),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(dashboardViewModel.collectionList[i].image != null)
                                    Container(
                                      height: AllDimension.oneFifty,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(AllDimension.four),
                                          image: DecorationImage(
                                              image: AssetImage(AllImages.shirt),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(height: AllDimension.eight),

                                    if(dashboardViewModel.collectionList[i].name != null)
                                    Text(dashboardViewModel.collectionList[i].name!.length>15?
                                    "${dashboardViewModel.collectionList[i].name!.substring(0,15)}...":
                                    dashboardViewModel.collectionList[i].name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AllDimension.twelve),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                      SizedBox(height: AllDimension.twentyFour),

                      InkWell(
                        onTap: (){
                          dashboardViewModel.setCategoryId(dashboardViewModel.categoryId.value);
                          Get.toNamed(RoutesGetters.getCollectionsRoute());
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: AllDimension.twentyFour,
                            right: AllDimension.twentyFour,
                            top: AllDimension.eight,
                            bottom: AllDimension.eight,
                          ),
                          decoration: BoxDecoration(
                              color: AllColors.redColorDark,
                              borderRadius: BorderRadius.circular(AllDimension.four)),
                          child: Text("VIEW ALL",
                              style: TextStyle(color: AllColors.whiteColor)),
                        ),
                      )
                    ],
                  ))
              else
                Container(
                  alignment: Alignment.center,
                    child: Text("No Collections!",
                    style: TextStyle(fontSize: AllDimension.twenty,
                    fontWeight: FontWeight.bold),)
                ),

              Container(
                width: AllDimension.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(AllDimension.sixteen),
                decoration: BoxDecoration(
                    color: AllColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(AllDimension.twentyFour)),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: AllDimension.four,
                  right: AllDimension.four,
                  top: AllDimension.eight,
                  bottom: AllDimension.sixteen,
                ),
                child: Column(
                  children: <Widget>[

                    Container(
                      margin:EdgeInsets.only(
                        top: AllDimension.two,
                        bottom: AllDimension.sixteen,
                      ),
                      child: Text(
                        "5 easy steps to place order",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AllDimension.twenty,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Image.asset(AllImages.explore,
                                  height: AllDimension.fortyEight),
                              Text("Explore", textAlign: TextAlign.center)
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Image.asset(AllImages.article,
                                  height: AllDimension.fortyEight),
                              Text("Article", textAlign: TextAlign.center)
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Image.asset(AllImages.sizeSet,
                                  height: AllDimension.fortyEight),
                              Text("Size|Set", textAlign: TextAlign.center)
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Image.asset(AllImages.addBag,
                                  height: AllDimension.fortyEight),
                              Text("Add To Bag", textAlign: TextAlign.center)
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Image.asset(AllImages.placeOrder,
                                  height: AllDimension.fortyEight),
                              Text("Place Order", textAlign: TextAlign.center)
                            ],
                          ),
                        )

                      ],
                    )

                  ],
                ),
              ),

              SizedBox(height: AllDimension.sixteen),

              Container(
                margin: EdgeInsets.only(
                    left: AllDimension.sixteen
                ),
                child: Text(
                  "Live ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: AllDimension.sixtyFour,
                      fontWeight: FontWeight.bold,
                      color: AllColors.greyColor),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: AllDimension.sixteen
                ),
                child: Text(
                  "to lead!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: AllDimension.sixtyFour,
                      fontWeight: FontWeight.bold,
                      color: AllColors.greyColor),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: AllDimension.sixteen,
                    top: AllDimension.eight
                ),
                child: Row(
                  children: <Widget>[

                    Text(
                      "Crafted with",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AllColors.greyColor),
                    ),

                    SizedBox(width: AllDimension.four),

                    Icon(
                        Icons.favorite,color: AllColors.redColorDark,
                        size: AllDimension.sixteen
                    ),

                    SizedBox(width: AllDimension.four),

                    Text(
                      "in Delhi, Tripur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AllColors.greyColor),
                    ),

                  ],
                ),
              ),

              SizedBox(height: AllDimension.thirtyTwo),

            ],
          )

        ],
      ),
    ));
  }

  static Widget tipsToOrder(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(AllDimension.sixteen),
            child: Text(
              "FIVE EASY STEPS TO PLACE ORDER",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AllDimension.thirtyTwo),
            ),
          ),
          SizedBox(
            height: 900,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 250,
                            padding: EdgeInsets.all(AllDimension.sixteen),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AllDimension.eight),
                              color: AllColors.lightCyanColor,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: AllDimension.oneHundred,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AllImages.explore),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "STEP",
                                    style: TextStyle(
                                        color: AllColors.blackColor,
                                        fontSize: AllDimension.sixteen),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "EXPLORE COLLECTION",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.twenty,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: AllDimension.eight),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 250,
                            padding: EdgeInsets.all(AllDimension.sixteen),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AllDimension.eight),
                              color: AllColors.lightCyanColor,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: AllDimension.oneHundred,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AllImages.article),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "STEP",
                                    style: TextStyle(
                                        color: AllColors.blackColor,
                                        fontSize: AllDimension.sixteen),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "SELECT ARTICLE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.twenty,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: AllDimension.eight),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 250,
                            padding: EdgeInsets.all(AllDimension.sixteen),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AllDimension.eight),
                              color: AllColors.lightCyanColor,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: AllDimension.oneHundred,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AllImages.sizeSet),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "STEP",
                                    style: TextStyle(
                                        color: AllColors.blackColor,
                                        fontSize: AllDimension.sixteen),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "SELECT \n SIZE|SET",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.twenty,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: AllDimension.eight),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 230,
                            padding: EdgeInsets.all(AllDimension.sixteen),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AllDimension.eight),
                              color: AllColors.lightCyanColor,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: AllDimension.oneHundred,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AllImages.addBag),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "STEP",
                                    style: TextStyle(
                                        color: AllColors.blackColor,
                                        fontSize: AllDimension.sixteen),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(AllDimension.eight),
                                  child: Text(
                                    "ADD TO BAG",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.twenty,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: AllDimension.sixteen),
                Container(
                  padding: EdgeInsets.all(AllDimension.sixteen),
                  height: AllDimension.threeFifty,
                  width: AllDimension.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AllDimension.eight),
                      color: AllColors.lightCyanColor,
                      image: DecorationImage(
                          image: AssetImage(AllImages.placeOrder))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: AllDimension.sixteen),
                        child: Text(
                          "STEP",
                          style: TextStyle(
                              color: AllColors.blackColor,
                              fontSize: AllDimension.sixteen),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(AllDimension.eight),
                        child: Text(
                          "ADD TO BAG",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontSize: AllDimension.twenty,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  static Widget newCategory(){
    final dashboardViewModel = Get.put(DashboardViewModel());
    return Container(
      margin: EdgeInsets.all(AllDimension.eight),
      child: Obx(()=>
      dashboardViewModel.categoryList.isEmpty?
          Placeholders.categoryPlaceholder():
          Row(
        children: <Widget>[

          Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  dashboardViewModel.getDashboardFashionCollections(1);
                  dashboardViewModel.setCategorySelected(true);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[

                    dashboardViewModel.categoryList[0].image == ""?
                    Container(
                      height: AllDimension.oneEighty,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AllImages.shirt),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(
                              color: dashboardViewModel.isCategorySelected.value == true?
                              AllColors.redColorDark:AllColors.whiteColor,
                              width: 4// border color
                          ),
                          borderRadius: BorderRadius.circular(
                              AllDimension.twelve
                          )
                      ),
                    )
                        :
                    Container(
                      height: AllDimension.oneEighty,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(dashboardViewModel.categoryList[0].image!),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(
                              color: dashboardViewModel.isCategorySelected.value == true?
                              AllColors.redColorDark:AllColors.whiteColor,
                              width: 4// border color
                          ),
                          borderRadius: BorderRadius.circular(
                              AllDimension.twelve
                          )
                      ),
                    ),

                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                            margin: EdgeInsets.all(AllDimension.sixteen),
                            child: Text(dashboardViewModel.categoryList[0].name==null?
                            "":dashboardViewModel.categoryList[0].name!,
                              style: TextStyle(fontSize: AllDimension.sixteen,
                                  fontWeight: FontWeight.bold),)
                        )
                    )

                  ],
                ),
              )
          ),

          SizedBox(width: AllDimension.twelve),

          Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  dashboardViewModel.getDashboardFashionCollections(2);
                  dashboardViewModel.setCategorySelected(false);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[

                    dashboardViewModel.categoryList[1].image == ""?
                    Container(
                      height: AllDimension.oneEighty,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AllImages.shirt),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(
                              color: dashboardViewModel.isCategorySelected.value == false?
                              AllColors.redColorDark:AllColors.whiteColor,
                              width: 4// border color
                          ),
                          borderRadius: BorderRadius.circular(
                              AllDimension.twelve
                          )
                      ),
                    )
                        :
                    Container(
                      height: AllDimension.oneEighty,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(dashboardViewModel.categoryList[1].image!),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(
                              color: dashboardViewModel.isCategorySelected.value == false?AllColors.redColorDark:AllColors.whiteColor,
                              width: 4// border color
                          ),
                          borderRadius: BorderRadius.circular(
                              AllDimension.twelve
                          )
                      ),
                    ),

                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                            margin: EdgeInsets.all(AllDimension.sixteen),
                            child: Text(dashboardViewModel.categoryList[1].name==null?
                            "":dashboardViewModel.categoryList[1].name!,
                              style: TextStyle(fontSize: AllDimension.sixteen,
                                  fontWeight: FontWeight.bold),)
                        )
                    )

                  ],
                ),
              )
          ),

        ],
      ),
      ),
    );
  }
}
