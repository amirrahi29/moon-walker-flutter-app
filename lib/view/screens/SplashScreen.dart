import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/custom_classes/AllImages.dart';
import 'package:moon_walker/view_model/SplashViewModel.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashViewModel = Get.put(SplashViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlayAnimationBuilder<double>(
        tween: Tween(begin: 50.0,end: 300.0),
        duration: const Duration(seconds: 3),
        delay:  const Duration(seconds: 1),
        curve: Curves.bounceInOut,
        builder: (context, value, child){
          return Container(
            height: AllDimension.infinity,
            width: AllDimension.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AllImages.loginBackground),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 200,
                  width: 200,
                  child: Column(
                    children: <Widget>[
                      Container(
                          height:150,
                          width:150,
                          child: Image.asset(AllImages.verticalLogo)
                      ),
                      Image.asset(AllImages.bottomLogo),
                    ],
                  )
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
