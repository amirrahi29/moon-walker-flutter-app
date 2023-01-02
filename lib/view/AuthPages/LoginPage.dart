import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view_model/AuthViewModel.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final authViewModel = Get.put(AuthViewModel());
  final phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(()=>
              LoadingOverlayPro(
                isLoading: authViewModel.isSendOtp.value,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AllImages.loginBackground),
                          fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(AllDimension.sixteen),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          SizedBox(height: AllDimension.oneFifty),

                          Container(
                              height: AllDimension.sixtyFour,
                              alignment: Alignment.center,
                              child: Image.asset(AllImages.man)
                          ),

                          SizedBox(height: AllDimension.twentyFour),

                          Container(
                              margin:EdgeInsets.only(
                                left: AllDimension.seventy,
                                right: AllDimension.seventy,
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(AllImages.bottomLogo)
                          ),

                          SizedBox(height: AllDimension.sixteen),

                          SizedBox(
                            height: AllDimension.eight,
                          ),
                          Text(
                            "PHONE NUMBER",
                            style: TextStyle(
                                fontSize: AllDimension.fourteen,
                                color: AllColors.whiteColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: AllDimension.four,
                              right: AllDimension.four,
                            ),
                            child: TextFormField(
                                controller: phoneController,
                                style: TextStyle(color: AllColors.whiteColor),
                                cursorColor: AllColors.whiteColor,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: AllColors.whiteColor),
                                  hintStyle: TextStyle(color: AllColors.whiteColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AllColors.whiteColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AllColors.whiteColor),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AllColors.whiteColor),
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Text(
                                      "+91",
                                      style: TextStyle(
                                          fontSize: AllDimension.sixteen,
                                          color: AllColors.whiteColor),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: AllDimension.twentyEight,
                          ),

                          InkWell(
                            onTap: (){
                              if(phoneController.text == ""){
                                GlobalEquipments.SnackToastFailed("Login error", "Invalid phone number");
                              }else if(phoneController.text.length != 10){
                                GlobalEquipments.SnackToastFailed("Login error", "Please enter 10 digit mobile number");
                              }else if(phoneController.text.contains(",") || phoneController.text.contains(".")){
                                GlobalEquipments.SnackToastFailed("Login error", "Invalid phone number");
                              }else{
                                authViewModel.sendOTPVM(phoneController.text);
                              }
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AllColors.redColorDark,
                                  borderRadius: BorderRadius.circular(AllDimension.four)),
                              child: Text(
                                'CONTINUE',
                                style: TextStyle(
                                    color: AllColors.whiteColor,
                                    fontSize: AllDimension.sixteen),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ));
  }
}
