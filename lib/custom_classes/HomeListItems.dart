import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/model/LeftDrawerModel.dart';
import 'AllDimension.dart';

class HomeListItems{

  static List<Map<String, dynamic>> homeCategoryList = [
    {
      'icon': Image.asset(AllImages.topCategories,height: AllDimension.fortyEight,),
      'title': 'Categories',
    },
    {
      'icon': Image.asset(AllImages.order,height: AllDimension.fortyEight,),
      'title': 'Order',
    },
    {
      'icon': Image.asset(AllImages.retailer,height: AllDimension.fortyEight,),
      'title': 'Retailer',
    },
    {
      'icon': Image.asset(AllImages.distributors,height: AllDimension.fortyEight,),
      'title': 'Distributors',
    }
  ];


  //left drawer items
  static List homeDrawerList = [
    LeftDrawerModel(
      title:'Retailers Orders',
      description:'Check your retailer order status',
      icon: const Icon(Icons.window_outlined),
    ),
    LeftDrawerModel(
      title:'Retailers',
      description:'Check your retailers',
      icon: Icon(Icons.location_history_outlined),
    ),
    LeftDrawerModel(
      title:'Distributors',
      description:'Check your distributors',
      icon: Icon(Icons.location_history),
    ),
    LeftDrawerModel(
      title:'Help Center',
      description:'Help regarding your purchases',
      icon: Icon(Icons.help_outline_outlined),
    ),
    LeftDrawerModel(
      title:'Planet Insider',
      description:'Perks, Privillages, Pride',
      icon: Icon(Icons.face),
    ),
    LeftDrawerModel(
      title:'Address',
      description:'Save addresses for a hassle-free checkout',
      icon: Icon(Icons.location_on),
    ),
    // LeftDrawerModel(
    //   title:'Profile',
    //   description:'Change your profile details & Password',
    //   icon: Icon(Icons.location_history_rounded),
    // ),
    LeftDrawerModel(
      title:'About Us',
      description:'',
      icon: Icon(Icons.supervised_user_circle_outlined),
    ),
    LeftDrawerModel(
      title:'Terms of Use',
      description:'',
      icon: Icon(Icons.note_alt_outlined),
    ),
    LeftDrawerModel(
      title:'Logout',
      description:'',
      icon: Icon(Icons.exit_to_app_outlined),
    )
  ];

}