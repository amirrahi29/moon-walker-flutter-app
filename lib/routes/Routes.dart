import 'package:get/get.dart';
import 'package:moon_walker/view/AuthPages/LoginPage.dart';
import 'package:moon_walker/view/AuthPages/OTPPage.dart';
import 'package:moon_walker/view/GoogleMap/GoogleAddressDetailsPage.dart';
import 'package:moon_walker/view/bottom_screens/CartScreen.dart';
import 'package:moon_walker/view/bottom_screens/CategoriesScreen.dart';
import 'package:moon_walker/view/bottom_screens/ScanScreen.dart';
import 'package:moon_walker/view/bottom_screens/WishlistScreen.dart';
import 'package:moon_walker/view/screens/AboutScreen.dart';
import 'package:moon_walker/view/screens/AddAddressScreen.dart';
import 'package:moon_walker/view/screens/AddressScreen.dart';
import 'package:moon_walker/view/screens/AllCollections.dart';
import 'package:moon_walker/view/screens/CheckoutScreen.dart';
import 'package:moon_walker/view/screens/DashboardScreen.dart';
import 'package:moon_walker/view/screens/DistributorsScreen.dart';
import 'package:moon_walker/view/screens/FilterDetailScreen.dart';
import 'package:moon_walker/view/screens/FilterScreen.dart';
import 'package:moon_walker/view/screens/HelpCenterScreen.dart';
import 'package:moon_walker/view/GoogleMap/LocationPickGoogleMap.dart';
import 'package:moon_walker/view/screens/OrderDetailScreen.dart';
import 'package:moon_walker/view/screens/OrderStatus.dart';
import 'package:moon_walker/view/screens/ProductDetailScreen.dart';
import 'package:moon_walker/view/screens/ProfileScreen.dart';
import 'package:moon_walker/view/screens/RetailerDistributorsAddresses.dart';
import 'package:moon_walker/view/screens/RetailerOrdersScreen.dart';
import 'package:moon_walker/view/screens/RetailersScreen.dart';
import 'package:moon_walker/view/screens/SeachProductsScreen.dart';
import 'package:moon_walker/view/screens/ShowFilterProductScreen.dart';
import 'package:moon_walker/view/screens/SplashScreen.dart';
import 'package:moon_walker/view/screens/TermsAndConditions.dart';
import 'RoutesScreensName.dart';

class RoutesClass {
  //list of all screens
  static List<GetPage> routes = [

    //splash screen
    GetPage(
        page: () => const SplashScreen(),
        name: RoutesScreensName.splashScreen,
        transition: Transition.circularReveal,
        transitionDuration: const Duration(seconds: 1)
    ),

    //dashboard screen
    GetPage(
        page: () => const DashboardScreen(),
        name: RoutesScreensName.dashboardScreen,
        transition: Transition.circularReveal,
    ),

    //scan screen
    GetPage(
        page: () => const ScanScreen(),
        name: RoutesScreensName.scanScreen,
        transition: Transition.downToUp,
    ),

    //wishlist screen
    GetPage(
        page: () => const WishlistScreen(),
        name: RoutesScreensName.wishlistScreen,
      transition: Transition.downToUp,
    ),

    //cart screen
    GetPage(
        page: () => const CartScreen(),
        name: RoutesScreensName.cartScreen,
      transition: Transition.downToUp,
    ),

    //Login screen
    GetPage(
        page: () => const LoginPage(),
        name: RoutesScreensName.loginScreen,
         transition: Transition.fade,
    ),

    //OTP screen
    GetPage(
        page: () => const OTPPage(),
        name: RoutesScreensName.otpScreen,
    ),

    //Order screen
    GetPage(
        page: () => const OrderStatus(),
        name: RoutesScreensName.orderStatusScreen,
        transition: Transition.rightToLeft,
    ),

    //retailer order screen
    GetPage(
        page: () => const RetailerOrdersScreen(),
        name: RoutesScreensName.retailOrderScreen,
        transition: Transition.rightToLeft,
    ),

    //retailer order screen
    GetPage(
        page: () => const RetailersScreen(),
        name: RoutesScreensName.retailScreen,
        transition: Transition.rightToLeft,
    ),

    //distribution screen
    GetPage(
        page: () => const DistributorsScreen(),
        name: RoutesScreensName.distributorsScreen,
        transition: Transition.rightToLeft,
    ),

    //help center screen
    GetPage(
        page: () => const HelpCenterScreen(),
        name: RoutesScreensName.helpCenterScreen,
        transition: Transition.rightToLeft,
    ),

    //address screen
    GetPage(
        page: () => const AddressScreen(),
        name: RoutesScreensName.addressScreen,
        transition: Transition.rightToLeft,
    ),

    //profile screen
    GetPage(
        page: () => const ProfileScreen(),
        name: RoutesScreensName.profileScreen,
        transition: Transition.fade,
    ),

    //about screen
    GetPage(
        page: () => const AboutScreen(),
        name: RoutesScreensName.aboutScreen,
        transition: Transition.rightToLeft,
    ),

    //terms screen
    GetPage(
        page: () => const TermsAndConditions(),
        name: RoutesScreensName.termsScreen,
        transition: Transition.rightToLeft,
    ),

    //filter screen
    GetPage(
        page: () => const FilterScreen(),
        name: RoutesScreensName.filterScreen,
        transition: Transition.rightToLeft,
    ),

    //product detail screen
    GetPage(
        page: () => const ProductDetailScreen(),
        name: RoutesScreensName.productDetailScreen,
        transition: Transition.rightToLeft,
    ),

    //checkout screen
    GetPage(
      page: () => const CheckoutScreen(),
      name: RoutesScreensName.checkoutScreen,
      transition: Transition.rightToLeft,
    ),

    //location google map pick address screen
    GetPage(
      page: () => const LocationPickGoogleMap(),
      name: RoutesScreensName.locationPickScreen,
      transition: Transition.rightToLeft,
    ),

    //google address detail screen
    GetPage(
      page: () => const GoogleAddressDetailsPage(),
      name: RoutesScreensName.locationAddressScreen,
      transition: Transition.downToUp,
    ),

    //collection screen
    GetPage(
      page: () => const AllCollections(),
      name: RoutesScreensName.collectionsScreen,
      transition: Transition.rightToLeft,
    ),

    //show filter product screen
    GetPage(
      page: () => ShowFilterProductScreen(),
      name: RoutesScreensName.showFilterProductScreen,
      transition: Transition.rightToLeft,
    ),

    //search product screen
    GetPage(
      page: () => SeachProductsScreen(),
      name: RoutesScreensName.searchProductScreen,
      transition: Transition.rightToLeft,
    ),

    //search product screen
    GetPage(
      page: () => AddAddressScreen(),
      name: RoutesScreensName.addAddressScreen,
      transition: Transition.rightToLeft,
    ),

    //search product screen
    GetPage(
      page: () => RetailerDistributorsAddresses(),
      name: RoutesScreensName.retailerDistributorsAddresesScreen,
      transition: Transition.rightToLeft,
    ),

    //search product screen
    GetPage(
      page: () => OrderDetailScreen(),
      name: RoutesScreensName.orderDetailScreen,
      transition: Transition.rightToLeft,
    ),

  ];
}
