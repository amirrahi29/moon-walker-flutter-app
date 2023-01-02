import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/FilterListViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';

class FilterDetailScreen extends StatefulWidget {
  const FilterDetailScreen({Key? key}) : super(key: key);

  @override
  State<FilterDetailScreen> createState() => _FilterDetailScreenState();
}

class _FilterDetailScreenState extends State<FilterDetailScreen> {

  final filterListViewModel = Get.put(FilterListViewModel());
  final productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.15,
        child: Container(
          height: AllDimension.infinity,
          width: AllDimension.infinity,
          color: AllColors.lightCyanColor!,
          child: GetBuilder<FilterListViewModel>(
            builder: (controller){
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[

                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                              padding: EdgeInsets.all(AllDimension.fourteen),
                              decoration: BoxDecoration(
                                  color: AllColors.redColorDark
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Text("FILTERS(${controller.count})",
                                      style: TextStyle(color: AllColors.whiteColor,
                                          fontSize: AllDimension.eighteen)),

                                  Icon(Icons.close,color: AllColors.whiteColor,
                                      size: AllDimension.twentyFour)

                                ],
                              )
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(AllDimension.eight),
                          decoration: BoxDecoration(
                              color: AllColors.whiteColor,
                              borderRadius: BorderRadius.circular(AllDimension.four)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Container(
                                  padding: EdgeInsets.only(
                                    left: AllDimension.sixteen,
                                    right: AllDimension.sixteen,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Container(
                                        padding: EdgeInsets.only(
                                          top: AllDimension.four,
                                          bottom: AllDimension.four,
                                        ),
                                        child: Text("Brands",
                                            style: TextStyle(color: AllColors.bannerFirstColor,
                                                fontSize: AllDimension.sixteen,
                                                fontWeight: FontWeight.bold)),
                                      ),

                                      Divider(color: AllColors.greyMoonWalkColor)

                                    ],
                                  )
                              ),

                              for(int i = 0; i<controller.brandList.length; i++)
                                InkWell(
                                  onTap: (){

                                    if(filterListViewModel.allBrandIdList.contains(controller.brandList[i].id!)){
                                      filterListViewModel.removeSetBrandId(controller.brandList[i].id!);
                                    }else{
                                      filterListViewModel.addSetBrandId(controller.brandList[i].id!);
                                    }

                                    if(!controller.filterList.contains(controller.brandList[i].name)){
                                      controller.addItem(controller.brandList[i].name!);
                                    }else{
                                      controller.removeItem(controller.brandList[i].name!);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: AllDimension.sixteen,
                                      right: AllDimension.sixteen,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: AllDimension.four,
                                        top: AllDimension.four,
                                      ),
                                      child: Text(controller.brandList[i].name==""?"":controller.brandList[i].name!,
                                          style: TextStyle(
                                              fontSize: AllDimension.sixteen
                                          )),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),

                        SizedBox(height: AllDimension.eight),
                        Container(
                          padding: EdgeInsets.all(AllDimension.eight),
                          decoration: BoxDecoration(
                              color: AllColors.whiteColor,
                              borderRadius: BorderRadius.circular(AllDimension.four)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Container(
                                  padding: EdgeInsets.only(
                                    left: AllDimension.sixteen,
                                    right: AllDimension.sixteen,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Container(
                                        padding: EdgeInsets.only(
                                          top: AllDimension.four,
                                          bottom: AllDimension.four,
                                        ),
                                        child: Text("Set",
                                            style: TextStyle(color: AllColors.bannerFirstColor,
                                                fontSize: AllDimension.sixteen,
                                                fontWeight: FontWeight.bold)),
                                      ),

                                      Divider(color: AllColors.greyMoonWalkColor)

                                    ],
                                  )
                              ),

                              for(int i = 0; i<controller.setList.length; i++)
                                InkWell(
                                  onTap: (){
                                    filterListViewModel.addSetId(i);
                                    if(!controller.filterList.contains(controller.setList[i])){
                                      controller.addItem(controller.setList[i]);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: AllDimension.sixteen,
                                      right: AllDimension.sixteen,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: AllDimension.four,
                                        top: AllDimension.four,
                                      ),
                                      child: Text(controller.setList[i],
                                          style: TextStyle(
                                              fontSize: AllDimension.sixteen
                                          )),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),

                        SizedBox(height: AllDimension.eight),
                        Container(
                          padding: EdgeInsets.all(AllDimension.eight),
                          decoration: BoxDecoration(
                              color: AllColors.whiteColor,
                              borderRadius: BorderRadius.circular(AllDimension.four)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Container(
                                  padding: EdgeInsets.only(
                                    left: AllDimension.sixteen,
                                    right: AllDimension.sixteen,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Container(
                                        padding: EdgeInsets.only(
                                          top: AllDimension.four,
                                          bottom: AllDimension.four,
                                        ),
                                        child: Text("Sort",
                                            style: TextStyle(color: AllColors.bannerFirstColor,
                                                fontSize: AllDimension.sixteen,
                                                fontWeight: FontWeight.bold)),
                                      ),

                                      Divider(color: AllColors.greyMoonWalkColor)

                                    ],
                                  )
                              ),

                              for(int i = 0; i<controller.sortingList.length; i++)
                                InkWell(
                                  onTap: (){
                                    filterListViewModel.addSortId(i);
                                    if(!controller.filterList.contains(controller.sortingList[i])){
                                      controller.addItem(controller.sortingList[i]);
                                    }else{
                                      controller.removeItem(controller.sortingList[i]);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: AllDimension.sixteen,
                                      right: AllDimension.sixteen,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: AllDimension.four,
                                        top: AllDimension.four,
                                      ),
                                      child: Text(controller.sortingList[i],
                                          style: TextStyle(
                                              fontSize: AllDimension.sixteen
                                          )),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  if(controller.filterList.isNotEmpty)
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right:0,
                      child: InkWell(
                        onTap: (){
                          productViewModel.setCollectionId(
                              productViewModel.collectionID.value == 0?0:productViewModel.collectionID.value,
                              int.parse(filterListViewModel.setIdAdd.value),
                              int.parse(filterListViewModel.setSortIdAdd.value),
                              filterListViewModel.setSearchIdAdd.value,
                              filterListViewModel.allBrandIdList,
                              "1"
                          );
                          Get.toNamed(RoutesGetters
                              .getProductFilterScreenRoute());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: AllDimension.twentyFour,
                            right: AllDimension.twentyFour,
                            top: AllDimension.twelve,
                            bottom: AllDimension.twelve,
                          ),
                          margin: EdgeInsets.all(AllDimension.eight),
                          decoration: BoxDecoration(
                              color: AllColors.bannerFirstColor,
                              borderRadius: BorderRadius.circular(AllDimension.four)),
                          child: Text(
                            "SHOW PRODUCT",
                            style: TextStyle(
                                color: AllColors.whiteColor,
                                fontSize: AllDimension.fourteen),
                          ),
                        ),
                      )
                  ),

                  Positioned(
                      bottom: AllDimension.fourty,
                      left: 0,
                      right:0,
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            top: AllDimension.sixteen,
                            bottom: AllDimension.sixteen,
                          ),
                          margin: EdgeInsets.all(AllDimension.eight),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              children: <Widget>[

                                if(controller.filterList.isNotEmpty)
                                  for(int i = 0; i<controller.filterList.length; i++)
                                    InkWell(
                                      onTap: (){
                                        controller.removeItem(controller.filterList[i]);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: AllDimension.eight,
                                          right: AllDimension.eight,
                                          top: AllDimension.four,
                                          bottom: AllDimension.four,
                                        ),
                                        margin: EdgeInsets.only(
                                          left: AllDimension.four,
                                          right: AllDimension.four,
                                          top: AllDimension.four,
                                          bottom: AllDimension.four,
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
                                        child: Wrap(
                                          children: <Widget>[

                                            Text(controller.filterList[i]==""?"":controller.filterList[i],style: TextStyle(
                                                color:AllColors.blackColor)),
                                            SizedBox(width: AllDimension.two),
                                            Icon(Icons.close,size: AllDimension.twenty,)

                                          ],
                                        ),
                                      ),
                                    )

                              ],
                            ),
                          )
                      )
                  )

                ],
              );
            },
          )
        )
    );
  }
}
