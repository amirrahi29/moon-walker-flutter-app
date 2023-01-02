import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/CategoryModel.dart';
import 'package:moon_walker/model/CollectionModel.dart';
import 'package:moon_walker/model/BrandModel.dart';
import 'package:moon_walker/model/ProductModel.dart';
import 'package:moon_walker/model/SlidersModel.dart';
import 'package:moon_walker/view/screens/FilterDetailScreen.dart';

class FilterRepository{

  static var client = http.Client();

  static Future<dynamic> getAllSortings() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.filters}"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);

      // print(convertedJson['data']['sorting']);

      List<String> sorting = [];
      for(var u in convertedJson['data']['sorting'].values.toList()){
        sorting.add(u);
      }
      if (convertedJson['success'] == true) {
        return sorting;
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Sorting", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getAllSets() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.filters}"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);

      List<String> sorts = [];
      for(var u in convertedJson['data']['sets'].values.toList()){
        sorts.add(u);
      }
      if (convertedJson['success'] == true) {
        return sorts;
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Sorts", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }


  static Future<dynamic> getAllBrands() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.filters}"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);

      if (convertedJson['success'] == true) {
        return (convertedJson['data']['brands'] as List).map((e) => BrandModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Sorts", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

}