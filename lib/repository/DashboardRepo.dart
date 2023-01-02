import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/CategoryModel.dart';
import 'package:moon_walker/model/CollectionModel.dart';
import 'package:moon_walker/model/SlidersModel.dart';

class DashboardRepo{

  static var client = http.Client();

  static Future<dynamic> getCategories() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.categories}?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return (convertedJson['data']['data'] as List).map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getUsers() async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse(Config.baseUrl + Config.dashboard),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return convertedJson['data']['user'];
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Categories", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }


  static Future<dynamic> getFashionCollections(int id) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.categories}/$id?page=1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      print(convertedJson['data']['collections']['data']);
      if (convertedJson['success'] == true) {
        return (convertedJson['data']['collections']['data'] as List).map((e) => CollectionModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Collections", e.toString());
      getFashionCollections(id);
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

  static Future<dynamic> getDashboardSliders(String latitude, String longitude) async {
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      //token fetch end
      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.dashboard}"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken,
            'latitude': latitude,
            'longitude': longitude,
          });
      var convertedJson = jsonDecode(response.body);

      List<SliderModel> sliderList = [];
      sliderList.clear();

      for(var u in convertedJson['data']['primarySliders']){
        sliderList.add(
            SliderModel(
              id: u['id'],
              name: u['name'],
              mobile_image: u['mobile_image'],
            ),
        );
      }

      if (convertedJson['success'] == true) {
        return sliderList;
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Sliders", e.toString());
      GlobalEquipments.MyLogs(e.toString());
      return null;
    }
  }

}