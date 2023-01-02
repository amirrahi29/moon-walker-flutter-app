import 'package:moon_walker/custom_classes/Singelton.dart';

class Config{

  //base url
  static String baseUrl = "https://api.moonwalkerindia.com/salesman/v1";

  // end url
  static String sendOtp = "/send-otp";
  static String resendOtp = "/resend-otp";
  static String verifyOtp = "/verify-otp";
  static String updateProfile = "/profile";
  static String logout = "/logout";

  static String categories = "/categories";
  static String dashboard = "/dashboard";
  static String products = "/products";
  static String filters = "/filters";
  static String productSets = "/product-sets";
  static String carts = "/carts";
  static String update = "/update";
  static String user = "/user";
  static String address = "/address";
  static String distributors = "/distributors";
  static String retailers = "/retailers";
  static String orders = "/orders";
  static String wishlists = "/wishlists";
  static String enquiries = "/enquiries";


  //request strings
  static String sendOTPRequest = "send-otp";
  static String reSendOTPRequest = "resend-otp";
  static String verifyOTPRequest = "verify-otp";

  //without token header
  static var wihoutTokenHeader = {
    'Accept': 'application/json',
  };

  static var withTokenHeader = {
    'Accept': 'application/json',
    'Authorization': Singelton.getToken()
  };

}