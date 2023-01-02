import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/GlobalEquipments.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:get/get.dart';
import 'package:moon_walker/view_model/AddressViewModel.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  List<String>? addressType = ['Home','Office'];
  final addressViewModel = Get.put(AddressViewModel());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final localityController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Obx(()=>SingleChildScrollView(
          child: Column(
            children: <Widget>[

              GlobalToolbar.backToolbar("Add Address",context),

              SizedBox(height: AllDimension.eight),

              Container(
                margin: EdgeInsets.all(
                    AllDimension.sixteen
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Row(
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 50,
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Name'
                            ),
                          ),
                        ),

                        SizedBox(width: AllDimension.eight),

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 50,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'E-mail'
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: AllDimension.twelve),
                    Row(
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 10,
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Phone'
                            ),
                          ),
                        ),

                        SizedBox(width: AllDimension.eight),

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 50,
                            controller: localityController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Locality'
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: AllDimension.twelve),
                    Row(
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 50,
                            controller: cityController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'City'
                            ),
                          ),
                        ),

                        SizedBox(width: AllDimension.eight),

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 50,
                            controller: stateController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'State'
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: AllDimension.twelve),
                    Row(
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 30,
                            controller: countryController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Country'
                            ),
                          ),
                        ),

                        SizedBox(width: AllDimension.eight),

                        Expanded(
                          flex: 1,
                          child: TextField(
                            maxLength: 6,
                            controller: pincodeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Pincode'
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: AllDimension.twelve),


                    TextFormField(
                      minLines: 2,
                      maxLines: 5,
                      controller: addressController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Full Address',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AllDimension.eight)),
                        ),
                      ),
                    ),
                    SizedBox(height: AllDimension.twelve),

                    SizedBox(height: AllDimension.eight),
                    Text("Address Type : ${addressViewModel.addressType.value ??""}",
                        style: TextStyle(fontSize: AllDimension.sixteen,
                        fontWeight: FontWeight.bold)),
                    SizedBox(height: AllDimension.twelve),
                    Container(
                      padding: EdgeInsets.all(AllDimension.four),
                      width: AllDimension.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AllDimension.eight),
                          color: AllColors.lightGreyColor
                      ),
                      child: DropdownButton(
                        hint: Text('Select Address Type'),
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueAccent,
                        ),
                        items: addressType!.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          addressViewModel.setAddress(val.toString());
                        },
                      ),
                    ),
                    SizedBox(height: AllDimension.eight),
                    Text("Selected : ${addressViewModel.addressType.value ??""}",
                    style: TextStyle(fontSize: AllDimension.sixteen)),

                    SizedBox(height: AllDimension.thirtyTwo),

                    InkWell(
                      onTap: (){
                        if(nameController.text != ""
                            && emailController.text != ""
                            && phoneController.text != ""
                            && localityController.text != ""
                            && cityController.text != ""
                            && stateController.text != ""
                            && countryController.text != ""
                            && pincodeController.text != ""
                            && addressController.text != ""){

                          addressViewModel.submitAddress(
                            nameController.text,
                            emailController.text,
                            phoneController.text,
                            localityController.text,
                            cityController.text,
                            stateController.text,
                            countryController.text,
                            pincodeController.text,
                            addressController.text,
                            context
                          );

                        }else{
                          GlobalEquipments.SnackToastFailed("Validation error",
                          "Please fill all the fields and try again!");
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: AllDimension.twentyFour,
                          right: AllDimension.twentyFour,
                          top: AllDimension.sixteen,
                          bottom: AllDimension.sixteen,
                        ),
                        decoration: BoxDecoration(
                            color: AllColors.bannerFirstColor,
                            borderRadius:
                            BorderRadius.circular(AllDimension.four)),
                        child: Text(
                          "Add Address",
                          style: TextStyle(
                              color: AllColors.whiteColor,
                              fontSize: AllDimension.sixteen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  ],
                ),
              )

            ],
          ),
        ))
    );
  }
}