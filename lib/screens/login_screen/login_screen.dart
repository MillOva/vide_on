import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/colors.dart';
import 'package:vide_on/global/custom_widgets/input_field.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/fonts.dart';
import 'package:vide_on/screens/login_screen/register_screen.dart';
import 'package:vide_on/services/login_email.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height:  _height, width: _width, color: obsidian(),
          child: Column(
            children: [
              SizedBox(height: 70*coefH),
              Text("VideOn",style: logoFont()),
              SizedBox(height: 64*coefH),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48*coefH),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome back!",style: headlineFont(),),
                    SizedBox(height: 48*coefH),
                    CustomInput(hint:"Email", controller: _email, obscure: false,
                    height: 44*coefH, width:  double.maxFinite, textInputType: TextInputType.emailAddress,),
                    SizedBox(height: 24*coefH),
                    CustomInput(hint:"Password", controller: _password, obscure: true,
                      height: 44*coefH, width:  double.maxFinite, textInputType: TextInputType.visiblePassword,),
                  ],
                ),
              ),
              SizedBox(height: 32*coefH),
              GestureDetector(
                onTap: ()=> LoginWithEmail().login(_email.text, _password.text, context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8*coefW),
                  alignment: Alignment.center,
                  height: 48*coefH, width: 200*coefW,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(23.5), color: sapphire()),
                  child: Text("Login",style: buttonFont(),),
                ),
              ),
              SizedBox(height: 32*coefH),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 1*coefH, width: 100*coefW, color: calcite(),),
                  SizedBox(width: 48*coefW),
                  Text("or",style: bodyFont(),),
                  SizedBox(width: 48*coefW),
                  Container(height: 1*coefH, width: 100*coefW, color: calcite(),),
                ],
              ),
              SizedBox(height: 32*coefH),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50*coefW),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: ()=> null,
                      child: Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                            image: DecorationImage(image: AssetImage('assets/images/google.png'),fit: BoxFit.fill)),),
                    ),
                    GestureDetector(
                      onTap: ()=> null,
                      child: Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                            image: DecorationImage(image: AssetImage('assets/images/apple.png'),fit: BoxFit.fill)),),
                    ),
                    GestureDetector(
                      onTap: ()=> null,
                      child: Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                            image: DecorationImage(image: AssetImage('assets/images/facebook.png'),fit: BoxFit.fill)),),
                    ),
                    GestureDetector(
                      onTap: ()=> null,
                      child: Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                            image: DecorationImage(image: AssetImage('assets/images/twitter.png'))),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 195*coefH,),
              Text("Don't have account?",style: bodyFont(),),
              GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen())),
                  child: Text("Create now!",style: hyperLinkBlue(),)),
            ],
          ),
        ),
      ),
    );
  }
}
