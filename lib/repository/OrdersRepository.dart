import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/CartModel.dart';
import 'package:moon_walker/model/CategoryModel.dart';
import 'package:moon_walker/model/CollectionModel.dart';
import 'package:moon_walker/model/OrderModel.dart';
import 'package:moon_walker/model/SizeModel.dart';
import 'package:moon_walker/model/SlidersModel.dart';
import 'package:moon_walker/view_model/CartViewModel.dart';

class OrdersRepo{

  static var client = http.Client();

  static Future<dynamic> getAllOrders() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.orders}?days=week&page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return (convertedJson['data']['orders']['data'] as List).map((e) => OrderModel.fromJson(e)).toList();
      } else {
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Orders", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getOrderDetails(int orderId) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.orders}/$orderId"),
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
      // GlobalEquipments.SnackToastFailed("Orders", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

}