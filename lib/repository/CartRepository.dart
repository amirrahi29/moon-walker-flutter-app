import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/CartModel.dart';
import 'package:moon_walker/model/CategoryModel.dart';
import 'package:moon_walker/model/CollectionModel.dart';
import 'package:moon_walker/model/SizeModel.dart';
import 'package:moon_walker/model/SlidersModel.dart';
import 'package:moon_walker/view_model/CartViewModel.dart';

class CartRepo{
  static var client = http.Client();

  static Future<dynamic> addCoreCart(String qty, List<SizeModel> coreSizes, int productId) async {

    var data;
    for(int i = 0; i<coreSizes.length; i++){
      data = {
        'product_id':productId.toString(),
        'quantity':qty,
        'sizes[${i}]':coreSizes[i].size,
      };
    }
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.carts),
          body: data,
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['success'];
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> addFashionCart(String qty, List<String> fasionSizes,
      int productId, String categoryIdForWishlist,String selectedColor) async {

    String myToken = await Singelton.getToken();

    var request = MultipartRequest('POST', Uri.parse(Config.baseUrl + Config.carts));
    request.fields['product_id'] = productId.toString();
    request.fields['quantity'] = qty;
    request.fields['color'] = selectedColor;
    for(int i = 0; i<fasionSizes.length; i++){
      request.fields['set_names[${i}]'] = fasionSizes[i];
    }
    request.headers["authorization"]=myToken;
    request.headers["Accept"]='application/json';
    http.Response response = await http.Response.fromStream(await request.send());
    final json = jsonDecode(response.body);
    final success = json['success'];
    final message = json['message'];
    print(request.fields);
        if (success == true) {
          return success;
        } else {
          GlobalEquipments.SnackToastFailed("Product addition failed", message.toString());
          return success;
        }
  }

  // static Future<dynamic> addFashionCart(String qty, List<String> fasionSizes,
  //     int productId, String categoryIdForWishlist,String selectedColor) async {
  //
  //   var data;
  //
  //   for(int i = 0; i<fasionSizes.length; i++){
  //     for(var u in fasionSizes){
  //       data = {
  //         'product_id':productId.toString(),
  //         'quantity': qty,
  //         'set_names[${i}]': u,
  //         'color':selectedColor
  //       };
  //     }
  //   }
  //   print(data);
  //   try {
  //     //token fetch start
  //     String myToken = await Singelton.getToken();
  //     //token fetch end
  //     var response = await client.post(
  //         Uri.parse(Config.baseUrl + Config.carts),
  //         body: data,
  //         headers: {
  //           'Accept': 'application/json',
  //           'Authorization': myToken
  //         });
  //     var convertedJson = jsonDecode(response.body);
  //     print(convertedJson);
  //     if (convertedJson['success'] == true) {
  //       return convertedJson['success'];
  //     } else {
  //       return convertedJson['success'];
  //     }
  //   } catch (e) {
  //     // GlobalEquipments.SnackToastFailed("Categories", e.toString());
  //     GlobalEquipments.MyLogs(e.toString());
  //     return null;
  //   }
  // }

  static Future<dynamic> AllCart() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.carts}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['data']['carts'] != "") {
        return convertedJson['data']['carts'];
      }else if (convertedJson['data']['carts'] == "") {
        return null;
      } else {
        return false;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return false;
    }
  }

  static Future<dynamic> cartBillDetailsRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.carts}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data']['billDetails'];
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Bill details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> retailerRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.carts}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data']['retailers'];
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Bill details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> distributorRepo() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.carts}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data']['distributors'];
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Bill details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> cartCust(String customerType) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.carts}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        if(customerType == "retailers"){
          return convertedJson['data']['retailers'];
        }
        if(customerType == "distributors"){
          return convertedJson['data']['distributors'];
        }
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Bill details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> cartAddressCust(String customerType) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.carts}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        if(customerType == "retailersAddress"){
          return convertedJson['data']['retailersAddress'];
        }
        if(customerType == "distributorsAddress"){
          return convertedJson['data']['distributorsAddress'];
        }
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Bill details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> destroyCart(int productId) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(Uri.parse("${Config.baseUrl}${Config.carts}/$productId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['success'];
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("My Cart", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return false;
    }
  }

  static Future<dynamic> checkout(int retailerId,int distributorId,int addressId) async {

    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.post(
          Uri.parse(Config.baseUrl + Config.carts+Config.update),
          body: {
            "retailer_id":retailerId.toString(),
            "distributor_id":distributorId.toString(),
            "address_id":addressId.toString(),
          },
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess(
            "Checkout", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed(
            "Checkout", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Bill details", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return false;
    }
  }

}