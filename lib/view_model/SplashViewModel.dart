import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends GetxController {

  var latitude = "".obs;
  var longitude = "".obs;
  var address = "".obs;
  var locality = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    checkPermissions();
    super.onInit();
  }

  void checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.storage,
    ].request();

    if(await Permission.location.request().isGranted &&
        await Permission.camera.request().isGranted &&
        await Permission.storage.request().isGranted){
         _getCurrentLocation();
    }else{
      GlobalEquipments.SnackToastFailed("Permission declined",
          "Please allow all the permissions to launch this application");
      GlobalEquipments.MyLogs("status: permission not granted");
      Get.offAllNamed(RoutesGetters.getSplashRoute());
    }
  }

  Future<void> launchPage() async {
    Future.delayed(const Duration(seconds: 2),
        () => {Get.offAllNamed(RoutesGetters.getLocationAddressRoute())});
  }

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    // calculateDistance();
    GlobalEquipments.MyLogs("Mylatitude: ${position.latitude}, placemarks: ${placemarks.first.locality}");

    if(placemarks.first.locality != ""){
      address.value = "${placemarks.first.locality.toString()},"
          " ${placemarks.first.street.toString()} ${placemarks.first.country.toString()}, ${placemarks.first.postalCode.toString()}";
      locality.value = placemarks.first.locality.toString();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locality', locality.value);
      await prefs.setString('address', address.value);
      launchPage();
    }
    return await Geolocator.getCurrentPosition();
  }

}
