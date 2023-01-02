import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/repository/ProductRepository.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {

  final productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: PagedGridView<int, dynamic>(
            showNewPageProgressIndicatorAsGridChild: false,
            showNewPageErrorIndicatorAsGridChild: false,
            showNoMoreItemsIndicatorAsGridChild: false,
            pagingController: productViewModel.pagingController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 80 / 120,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              itemBuilder: (context, item, index){
                return Column(
                  children: <Widget>[

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

                              if(item.product!.name!.length > 20)
                                Text(item.product!.name! == ""?
                                "" :item.product!.name!.substring(0,20),
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

                              Text(item.product.totalQuantity! == ""?
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
                );
              },
            ),
          )
        )
    );
  }
}
