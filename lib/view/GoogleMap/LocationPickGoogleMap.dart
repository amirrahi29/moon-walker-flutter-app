import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';

class LocationPickGoogleMap extends StatefulWidget {
  const LocationPickGoogleMap({Key? key}) : super(key: key);

  @override
  State<LocationPickGoogleMap> createState() => _LocationPickGoogleMapState();
}

class _LocationPickGoogleMapState extends State<LocationPickGoogleMap> {

  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Location Name:";

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Stack(
            children:[

              GoogleMap( //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition( //innital position in map
                  target: startLocation, //initial position
                  zoom: 14.0, //initial zoom level
                ),
                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    mapController = controller;
                  });
                },
                onCameraMove: (CameraPosition cameraPositiona) {
                  cameraPosition = cameraPositiona; //when map is dragging
                },
                onCameraIdle: () async { //when map drag stops
                  List<Placemark> placemarks = await placemarkFromCoordinates(cameraPosition!.target.latitude, cameraPosition!.target.longitude);
                  setState(() { //get place name from lat and lang
                    location = placemarks.first.administrativeArea.toString() + ", " +  placemarks.first.street.toString();
                  });
                },
              ),

              Center( //picker image on google map
                child: Container(
                  height: AllDimension.fiftyFour,
                  width: AllDimension.twoFourty,
                  padding: EdgeInsets.all(AllDimension.eight),
                  decoration: BoxDecoration(
                    color: AllColors.blackColor,
                    borderRadius: BorderRadius.circular(AllDimension.eight)
                  ),
                  child: Column(
                    children: <Widget>[

                      Text("Order will be delivered here",style: TextStyle(
                          color: AllColors.whiteColor,
                          fontSize: AllDimension.fourteen,
                      fontWeight: FontWeight.bold)),
                      Text("Place the pin accurately on the map",style: TextStyle(
                          color: AllColors.greyLiColor,
                        fontSize: AllDimension.twelve
                      )),

                    ],
                  )
                )
              ),

              Positioned(  //widget to display location name
                  bottom:0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(AllDimension.sixteen),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: AllColors.whiteColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text("SELECT DELIVERY LOCATION",
                        style: TextStyle(
                          color: AllColors.greyColor,
                          fontSize: AllDimension.twelve,
                          fontWeight: FontWeight.bold
                        ),),

                        Row(
                          children: <Widget>[

                            Row(
                              children: <Widget>[

                                Icon(Icons.location_on),
                                SizedBox(width: AllDimension.eight),
                                Text("SELECT DELIVERY LOCATION",
                                  style: TextStyle(
                                      color: AllColors.greyColor,
                                      fontSize: AllDimension.twelve,
                                      fontWeight: FontWeight.bold
                                  ),),

                              ],
                            )

                          ],
                        )

                      ],
                    )
                  )
              )

            ]
        )
    );
  }
}
