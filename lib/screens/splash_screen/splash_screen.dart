import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/watch_now_screen.dart';
import 'package:vide_on/screens/login_screen/login_screen.dart';
import 'package:vide_on/services/user/user.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: _user == null ? LoginScreen() : WatchNowScreen(),
      title: Text('VideOn',style: logoFont()),
      image: Image.asset('assets/images/play.png', height: 100, width: 100,),
      photoSize: 100.0,

       backgroundColor: obsidian(),
      loaderColor: calcite(),
    );
  }
}
