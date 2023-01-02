import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/AuthViewModel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final authViewModel = Get.put(AuthViewModel());
  CountdownTimerController? countDownTimer;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  var passedPhoneNumber = Get.arguments;
  final otpTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    countDownTimer = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    GlobalEquipments.MyLogs('onEnd');
    setState(() {
      authViewModel.isResendSmsBtnEnabled.value = true;
    });
  }

  @override
  void dispose() {
    countDownTimer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => LoadingOverlayPro(
                  isLoading: authViewModel.isVerifyOtp.value,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GlobalToolbar.OTPToolbarBlock(),
                        SizedBox(height: AllDimension.oneFifty),
                        CountdownTimer(
                          onEnd: onEnd,
                          endTime: endTime,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time == null) {
                              return Column(
                                children: <Widget>[
                                  Text("0",
                                      style: TextStyle(
                                          fontSize: AllDimension.fortyEight,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "OTP Expired!",
                                    style: TextStyle(
                                        color: AllColors.redColorDark),
                                  )
                                ],
                              );
                            }
                            return Text("${time.sec}",
                                style: TextStyle(
                                    fontSize: AllDimension.fortyEight,
                                    fontWeight: FontWeight.bold));
                          },
                        ),
                        SizedBox(height: AllDimension.sixteen),
                        Text(
                          "We have sent a verification code to",
                          style: TextStyle(fontSize: AllDimension.sixteen),
                        ),
                        SizedBox(height: AllDimension.eight),
                        Container(
                          child: Text(
                            "+91 ${passedPhoneNumber}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AllDimension.sixteen),
                          ),
                        ),
                        SizedBox(height: AllDimension.fortyEight),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: AllColors.greyColor,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 4,
                              obscureText: true,
                              obscuringCharacter: '*',
                              obscuringWidget: Container(
                                  margin:
                                      EdgeInsets.only(top: AllDimension.eight),
                                  alignment: Alignment.center,
                                  child: Text("*",
                                      style: TextStyle(
                                          fontSize: AllDimension.fortyEight))
                                  // child: Image.asset(AllImages.verticalLogo,height: AllDimension.thirtyFive),
                                  ),
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 2) {
                                  return "All fields are required!";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 60,
                                fieldWidth: 60,
                                activeFillColor: Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: false,
                              //errorAnimationController: errorController,
                              controller: otpTextController,
                              // enabled: _authController.isEnabled.value,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.white,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                print('completed');
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              onChanged: (value) {
                                // debugPrint(value);
                                setState(() {
                                  //currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
                                return true;
                              },
                            )),
                        Container(
                          margin: EdgeInsets.all(AllDimension.twentyFour),
                          child: InkWell(
                            onTap: () {
                              if (otpTextController.text.length != 4 ||
                                  otpTextController.text == "" ||
                                  otpTextController.text.contains(".") ||
                                  otpTextController.text.contains(",")) {
                                GlobalEquipments.SnackToastFailed(
                                    "OTP Invalid", "Please enter valid OTP!");
                              } else {
                                authViewModel.verifyOTPVM(
                                    passedPhoneNumber, otpTextController.text);
                              }
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AllColors.redColorDark,
                                  borderRadius: BorderRadius.circular(
                                      AllDimension.eight)),
                              child: Text(
                                'VERIFY OTP',
                                style: TextStyle(
                                    color: AllColors.whiteColor,
                                    fontSize: AllDimension.sixteen),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: authViewModel.isResendSmsBtnEnabled.value,
                          child: InkWell(
                            onTap: () {
                              authViewModel.reSendOTPVM(
                                  passedPhoneNumber, context);
                            },
                            child: Text(
                              "Resend SMS",
                              style: TextStyle(
                                  color: AllColors.greyMoonWalkColor,
                                  fontSize: AllDimension.sixteen),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AllDimension.oneFifty,
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
