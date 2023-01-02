import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/Placeholders.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';
import 'package:moon_walker/view_model/WishlistViewModel.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  final productViewModel = Get.put(ProductViewModel());
  final wishlistViewModel = Get.put(WishlistViewModel());

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Obx(()=>Column(
          children: <Widget>[

            GlobalToolbar.backToolbar("My Wishlist",context),

            if (wishlistViewModel.isWishlistAvailable.value == 1)
            Expanded(
                child:Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(
                          top:AllDimension.sixtyFour,
                          bottom:AllDimension.eight,
                          left:AllDimension.eight,
                          right:AllDimension.eight,
                      ),
                      child:  RefreshIndicator(
                        onRefresh: wishlistViewModel.refreshList,
                        child: ListView.builder(
                            itemCount: wishlistViewModel.searchWishlistList.length,
                            itemBuilder: (context,index){
                              return Container(
                                  margin: EdgeInsets.only(bottom: AllDimension.eight),
                                  child:  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      wishlistViewModel.searchWishlistList[index].image!=""?
                                      Container(
                                        width: AllDimension
                                            .oneHundred,
                                        height: AllDimension
                                            .oneFifty,
                                        child: Image.network(wishlistViewModel.searchWishlistList[index].image!,
                                          fit: BoxFit.cover,),
                                      ):Container(
                                        width: AllDimension
                                            .oneHundred,
                                        height: AllDimension
                                            .oneFifty,
                                        child: Image
                                            .asset(
                                          AllImages
                                              .shirt,
                                          fit: BoxFit
                                              .cover,
                                        ),
                                      ),

                                      SizedBox(
                                        width: AllDimension.sixteen,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${wishlistViewModel.searchWishlistList[index].name??""}",
                                          style: TextStyle(
                                              fontSize: AllDimension.sixteen,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: AllDimension.twenty,
                                      ),
                                      Container(
                                        child: Text(
                                          "Rs.${wishlistViewModel.searchWishlistList[index].price}",
                                          style: TextStyle(
                                              fontSize: AllDimension.sixteen,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: AllDimension.twenty,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          wishlistViewModel.deleteWishlist(wishlistViewModel.searchWishlistList[index].cartId.toString());
                                        },
                                        child: Container(
                                            child: Icon(
                                              Icons.delete,
                                              color: AllColors.redColor,
                                            )),
                                      )
                                    ],
                                  )
                              );
                            }
                        ),
                      ),
                    ),

                    SizedBox(height: AllDimension.eight),

                    Container(
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
                          wishlistViewModel.searchOrders(value);
                        },
                      ),
                    )

                  ],
                )
            )
            else if (wishlistViewModel.isWishlistAvailable.value == 2)
              Expanded(
                child: Center(
                  child: Text(
                    "No Wishlist items!",
                    style: TextStyle(
                        fontSize: AllDimension.thirtyTwo,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              Expanded(child: Placeholders.orderPlaceholder())

          ],
        ))
    );
  }
}
