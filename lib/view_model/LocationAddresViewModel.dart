import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/custom_classes/Singelton.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationAddresViewModel extends GetxController{

  var locality = "".obs;
  var address = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getLocationDetails();
    launchPage();
    super.onInit();
  }

  Future<void> getLocationDetails() async{
    final prefs = await SharedPreferences.getInstance();
    locality.value = (await prefs.getString('locality'))!;
    address.value = (await prefs.getString('address'))!;
  }

  Future<void> launchPage() async {
    var token = await Singelton.getToken();
    if(token != null){
      GlobalEquipments.MyLogs("AuthToken: $token");
      Future.delayed(const Duration(seconds: 2),
              () => {Get.offAllNamed(RoutesGetters.getDashboardRoute())}
      );
    }else{
      Future.delayed(const Duration(seconds: 2),
              () => {Get.offAllNamed(RoutesGetters.getLoginRoute())}
      );
    }
  }

}