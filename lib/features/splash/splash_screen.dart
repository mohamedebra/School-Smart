import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../core/PreferenceUtils.dart';
import '../../core/constants/images.dart';
import '../auth/login_screen.dart';
import '../home/home_View.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // _route();


    Timer(const Duration(seconds: 3), () async{
      if (await PreferenceUtils.isLogin()) {
        Get.offAll(HomeView());

      } else {
        Get.offAll(SignInScreen());
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          splashIconSize: 250,
          duration: 3000,
          animationDuration: const Duration(seconds: 1),
          splash: Image.asset(Images.logo),
          nextScreen: const SizedBox()),
    );
  }
}
