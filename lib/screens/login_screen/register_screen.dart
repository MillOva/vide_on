import 'package:flutter/material.dart';
import 'package:vide_on/global/colors.dart';
import 'package:vide_on/global/fonts.dart';
import 'package:vide_on/screens/login_screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //  padding: EdgeInsets.symmetric(horizontal: 50),
        color: obsidian(),
        child: Column(
          children: [
            //SizedBox(height: 70),
            SizedBox(height: 40),
            Text("VideOn",style: logoFont()),
            SizedBox(height: 64),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 48),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to VideOn!",style: headlineFont(),),
                  SizedBox(height: 48),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    height: 44, width: double.maxFinite,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                    child: Text("Name",style: bodyFont(),),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    height: 44, width: double.maxFinite,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                    child: Text("Email",style: bodyFont(),),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    height: 44, width: double.maxFinite,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                    child: Text("Password",style: bodyFont(),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: calcite()),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text("I agree with ", style: bodyFont(),),
                  Text("Terms&Conditions", style: hyperLinkWhite(),)
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              height: 48, width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(23.5), color: sapphire()),
              child: Text("Create Account",style: buttonFont(),),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 1, width: 100, color: calcite(),),
                SizedBox(width: 48),
                Text("or",style: bodyFont(),),
                SizedBox(width: 48),
                Container(height: 1, width: 100, color: calcite(),),
              ],
            ),
            SizedBox(height: 36),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: ()=> null,
                    child: Container(
                      height: 40, width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                          image: DecorationImage(image: AssetImage('assets/images/google.png'))),),
                  ),
                  GestureDetector(
                    onTap: ()=> null,
                    child: Container(
                      height: 40, width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                          image: DecorationImage(image: AssetImage('assets/images/apple.png'))),),
                  ),
                  GestureDetector(
                    onTap: ()=> null,
                    child: Container(
                      height: 40, width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,
                          image: DecorationImage(image: AssetImage('assets/images/facebook.png'))),),
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
            SizedBox(height: 28),
            Text("Already have account?",style: bodyFont(),),
            TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),
                child: Text("Login now!",style: hyperLinkBlue(),))
          ],
        ),
      ),
    );
  }
}
