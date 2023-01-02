import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/view/bottom_screens/CartScreen.dart';
import 'package:moon_walker/view/bottom_screens/CategoriesScreen.dart';
import 'package:moon_walker/view/bottom_screens/HomeScreen.dart';
import 'package:moon_walker/view/bottom_screens/ScanScreen.dart';
import 'package:moon_walker/view/bottom_screens/WishlistScreen.dart';
import 'AllImages.dart';

class BottomTabItems {
  // List<TabItem> items = [];

  //tab index
  int visit = 0;
  int selectedTab = 0;

  //tab pages
  List<Widget> allBottomPages = [
    HomeScreen(),
    CategoriesScreen(),
    ScanScreen(),
    WishlistScreen(),
    CartScreen()
  ];

  //tabs icons and titles
  List<BottomNavigationBarItem> allTabs(int i,selectedColor) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Image.asset(AllImages.home,
        color: selectedColor == 0?AllColors.redColorDark:AllColors.greyColor,
        height: selectedColor == 0?AllDimension.thirtyTwo:AllDimension.twentyEight
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(AllImages.categories,
            color: selectedColor == 1?AllColors.redColorDark:AllColors.greyColor,
            height: selectedColor == 1?AllDimension.thirtyTwo:AllDimension.twentyEight
        ),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(AllImages.scanner,
            color: selectedColor == 2?AllColors.redColorDark:AllColors.greyColor,
            height: selectedColor == 2?AllDimension.thirtyTwo:AllDimension.twentyEight
        ),
        label: 'Scan',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(AllImages.wishlist,
            color: selectedColor == 3?AllColors.redColorDark:AllColors.greyColor,
            height: selectedColor == 3?AllDimension.thirtyTwo:AllDimension.twentyEight
        ),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(AllImages.cart,
            color: selectedColor == 4?AllColors.redColorDark:AllColors.greyColor,
            height: selectedColor == 4?AllDimension.thirtyTwo:AllDimension.twentyEight
        ),
        label: 'Cart',
      ),
    ];
  }
}
