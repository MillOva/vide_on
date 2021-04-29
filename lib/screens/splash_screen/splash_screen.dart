import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vide_on/global/colors.dart';
import 'package:vide_on/global/fonts.dart';
import 'package:vide_on/screens/login_screen/login_screen.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: LoginScreen(),
      title: Text('VideOn',style: logoFont()),
      image: Image.asset('assets/images/logo.png', height: 100, width: 100,),
      photoSize: 100.0,

       backgroundColor: obsidian(),
      loaderColor: calcite(),
    );
  }
}
