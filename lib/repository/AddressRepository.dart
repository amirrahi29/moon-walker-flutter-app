import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_walker/custom_classes/Config.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/model/AddressModel.dart';

class AddressRepository {

  static var client = http.Client();

  static Future<dynamic> addAddressRepo(
      String nameController,
      String emailController,
      String phoneController,
      String localityController,
      String cityController,
      String stateController,
      String countryController,
      String pincodeController,
      String addressController,
      String addressType) async {

    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      String userId = await Singelton.getUserId();
      //token fetch end

      var data = {
        'user_id':userId,
        'name':nameController,
        'email':emailController,
        'phone':phoneController,
        'address':addressController,
        'locality':localityController,
        'city':cityController,
        'state':stateController,
        'country':countryController,
        'pin_code':pincodeController,
        'default':'Yes',
        'type':addressType
      };

      var response = await client.post(
          Uri.parse(Config.baseUrl+Config.user + Config.address),
          body: data,
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      //logs start
      GlobalEquipments.MyLogs(convertedJson.toString());
      //logs end
      if (convertedJson['success'] == true) {
        GlobalEquipments.SnackToastSuccess(
            "Address", convertedJson['message']);
        return convertedJson['success'];
      } else {
        GlobalEquipments.SnackToastFailed(
            "Address", convertedJson['message']);
        return convertedJson['success'];
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Address", e.toString());
      return false;
    }
  }

  static Future<dynamic> getAddressRepo() async{
    try {
      //token fetch start
      String myToken = await Singelton.getToken();
      String userId = await Singelton.getUserId();
      //token fetch end

      var response = await client.get(
          Uri.parse("${Config.baseUrl}${Config.user}${Config.address}?id=$userId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': myToken
          });
      var convertedJson = jsonDecode(response.body);
      if (convertedJson['success'] == true) {
        return (convertedJson['data'] as List).map((e) => AddressModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      // GlobalEquipments.SnackToastFailed("Address", e.toString());
      return null;
    }
  }


}
