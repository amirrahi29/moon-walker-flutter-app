import 'package:shared_preferences/shared_preferences.dart';

class Singelton{

  static saveToken(String token, String userId) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("authToken",token);
    prefs.setString("userId",userId);
  }

  static Future<dynamic> getToken()async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString('authToken') != null){
      return prefs.getString('authToken');
    }else{
      return null;
    }
  }

  static Future<dynamic> getUserId()async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString('userId') != null){
      return prefs.getString('userId');
    }else{
      return null;
    }
  }

  static Future<List> getUserDetails()async{
    List<String> userList = [];
    userList.clear();
    final prefs = await SharedPreferences.getInstance();
    userList.add(prefs.getString('id')!);
    userList.add(prefs.getString('name')!);
    userList.add(prefs.getString('email')!);
    userList.add(prefs.getString('phone')!);
    userList.add(prefs.getString('avatar')!);
    return userList;
  }

  static clearAuth()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}