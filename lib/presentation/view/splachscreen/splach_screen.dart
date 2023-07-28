// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure_master1/constants/images.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/login/login_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/mainlayout/mainlayout_screen.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: double.infinity,
        // splashIconSize: 400,
        duration: 3000,
        splash: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageAsset.splachAll,
                  ),
                  fit: BoxFit.fitWidth)),
        ),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
