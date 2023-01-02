import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/ProductModel.dart';
import 'package:moon_walker/model/WislistModel.dart';

class ProductRepository{

  static var client = http.Client();

  static Future<dynamic> getAllProducts(int collectionId,int sets, int sorts, String search, List<int> brandId, String page) async {

    var myBrand = "";
    for(var u in brandId){
      myBrand+="${u},";
    }

    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.products}?collection_id=$collectionId&brand_ids[]=$myBrand&sets=$sets&sort=$sorts&search=$search&&page=${1}"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      print(convertedJson);
      if (convertedJson['success'] == true) {
        return (convertedJson['data'] as List).map((e) => ProductMainModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getAllSearchProducts(String search, String page) async {
    print("page no: ${page}");
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.products}?search=$search&&page=${page}"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      print(convertedJson);
      if (convertedJson['success'] == true) {
        return (convertedJson['data'] as List).map((e) => ProductMainModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getAllFilterProducts(int collectionId) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.products}?collection_id=${collectionId}&&page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return (convertedJson['data'] as List).map((e) => ProductMainModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getProductDetailsRepo(int productId,String myColor) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.products}/$productId?color=$myColor"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data'];
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Product Details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getAllProductSets(String productId, String color) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.post(
          Uri.parse("${Config.baseUrl}${Config.productSets}"),
          body: {
            "product_id":productId,
            "color":color,
          },
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data'];
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Product Sets", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> addWishlist(String productId) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.post(
          Uri.parse("${Config.baseUrl}${Config.wishlists}"),
          body: {
            "product_id":productId,
          },
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess("My Wishlist", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed("My Wishlist", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Product Sets", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return false;
    }
  }

  static Future<dynamic> deleteWishlist(String productId) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.wishlists}/$productId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess("My Wishlist", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastSuccess("My Wishlist", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Product Sets", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return false;
    }
  }

  static Future<dynamic> wishlistRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.wishlists}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data'];
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Product Sets", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

}