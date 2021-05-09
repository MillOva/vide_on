import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/colors.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/fonts.dart';
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
      image: Image.asset('assets/images/play.png', height: 100, width: 100,),
      photoSize: 100.0,

       backgroundColor: obsidian(),
      loaderColor: calcite(),
    );
  }
}
