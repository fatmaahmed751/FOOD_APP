
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/screens/first_page.dart';

import 'on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
try {
  print('hhhhhhhhhhhhhh');
   Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (_) => OnBoardingScreen()));
    print('object');
   });
}catch(e){
 print(e.toString());
}

  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: AppColors.backgroundColor,
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.dark,
    //));
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.cover,
          ),
        ),

      ),

    );

  }
}
