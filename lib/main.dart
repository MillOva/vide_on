import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/screens/splash_screen/splash_screen.dart';
import 'package:vide_on/services/login_services/login_email.dart';
import 'package:vide_on/services/user/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConcreteUser>.value(
        value: LoginWithEmail().notifyAboutUser(),
        child:
      MaterialApp(
          title: 'VideOn',
          theme: ThemeData(
            // Define the default brightness.
            brightness: Brightness.light,
            primaryColorBrightness: Brightness.light,

            // Define the default colors.
            primaryColor: charcoalGrey(),
            scaffoldBackgroundColor: obsidian(),
            accentColor: sapphire(),
          ),
          home: CustomSplashScreen(),
        ));
  }
}
