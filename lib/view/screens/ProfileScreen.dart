import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:moon_walker/view_model/ProfileViewModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final profileViewModel = Get.put(ProfileViewModel());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Obx(()=>LoadingOverlayPro(
          isLoading: profileViewModel.isUpdateLoader.value,
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  GlobalToolbar.backToolbar("Profile",context),

                  Container(
                    margin: EdgeInsets.all(AllDimension.sixteen),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        InkWell(
                          onTap:(){

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Transform.rotate(
                                angle: 45 * math.pi / 20,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.key_outlined,
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Text("Change Password",
                                style: TextStyle(
                                    fontSize: AllDimension.sixteen
                                ),)

                            ],
                          ),
                        ),

                        SizedBox(height: AllDimension.sixteen),

                        Container(
                            margin: EdgeInsets.only(
                                bottom: AllDimension.eight
                            ),
                            child: Text("Full Name",
                              style: TextStyle(fontSize:
                              AllDimension.fourteen,
                                  fontWeight: FontWeight.bold),)
                        ),
                        TextField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AllDimension.eight)
                            ),
                            labelText: profileViewModel.name.value,
                            hintText: 'Enter full name',
                          ),
                        ),

                        SizedBox(height: AllDimension.sixteen),

                        Container(
                            margin: EdgeInsets.only(
                                bottom: AllDimension.eight
                            ),
                            child: Text("Email ID",
                              style: TextStyle(fontSize:
                              AllDimension.fourteen,
                                  fontWeight: FontWeight.bold),)
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AllDimension.eight)
                            ),
                            hintText: 'Enter email id',
                              labelText: profileViewModel.email.value
                          ),
                        ),

                        SizedBox(height: AllDimension.sixteen),

                        Container(
                            margin: EdgeInsets.only(
                                bottom: AllDimension.eight
                            ),
                            child: Text("Phone Number",
                              style: TextStyle(fontSize:
                              AllDimension.fourteen,
                                  fontWeight: FontWeight.bold),)
                        ),
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AllDimension.eight)
                            ),
                            hintText: '10 digit phone number',
                              labelText: profileViewModel.phone.value
                          ),
                        ),

                        SizedBox(height: AllDimension.sixteen),

                        InkWell(
                          onTap: (){
                            if(nameController.text != "" &&
                                emailController.text != "" &&
                                phoneController.text != "" &&
                                nameController.text.length<50 &&
                                phoneController.text.length == 10 &&
                                !phoneController.text.contains(".") &&
                                !phoneController.text.contains(",")){
                                 profileViewModel.updateProfile(nameController.text, emailController.text, phoneController.text,context);
                              }else{
                                GlobalEquipments.SnackToastFailed("Validation error!", "Please check all the fields and try again!");
                              }
                          },
                          child: Container(
                            width: AllDimension.oneHundred,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: AllDimension.eight,
                              right: AllDimension.eight,
                              top: AllDimension.eight,
                              bottom: AllDimension.eight,
                            ),
                            decoration: BoxDecoration(
                                color: AllColors.blueColorLight,
                                borderRadius: BorderRadius.circular(AllDimension.four)),
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  color: AllColors.whiteColor,
                                  fontSize: AllDimension.eighteen),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),

                ],
              )
          ),
        ))
    );
  }
}
