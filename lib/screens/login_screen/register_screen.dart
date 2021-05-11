import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/colors.dart';
import 'package:vide_on/global/custom_widgets/input_field.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/fonts.dart';
import 'package:vide_on/screens/login_screen/login_screen.dart';
import 'package:vide_on/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/services/regiseter_services/register_email.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isAgreed = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //  padding: EdgeInsets.symmetric(horizontal: 50),
        color: obsidian(),
        child: Column(
          children: [
            SizedBox(height: 70*coefH),
            Text("VideOn",style: logoFont()),
            SizedBox(height: 64*coefH),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 48*coefW),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to VideOn!",style: headlineFont(),),
                  SizedBox(height: 48*coefH),
                  CustomInput(hint:"Name", controller: _name, obscure: false,
                    height: 44*coefH, width:  double.maxFinite, textInputType: TextInputType.name,),
                  SizedBox(height: 24*coefH),
                  CustomInput(hint:"Email", controller: _email, obscure: false,
                    height: 44*coefH, width:  double.maxFinite, textInputType: TextInputType.emailAddress,),
                  SizedBox(height: 24*coefH),
                  CustomInput(hint:"Password", controller: _password, obscure: true,
                    height: 44*coefH, width:  double.maxFinite, textInputType: TextInputType.visiblePassword,),
                ],
              ),
            ),
            SizedBox(height: 16*coefH),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 48*coefW),
              child: Row(
                children: [
                  isAgreed ?
                  GestureDetector(
                  onTap: ()=> setState((){isAgreed = false;}),
                  child: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: sapphire(),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: sapphire()),
                    ),
                    child: Icon(CupertinoIcons.checkmark_alt, color: calcite(),),
                  ),
                )
                      :
                  GestureDetector(
                    onTap: ()=> setState((){isAgreed = true;}),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: calcite()),
                      ),
                    ),
                  ),
                  SizedBox(width: 24*coefW),
                  Text("I agree with ", style: bodyFont(),),
                  GestureDetector(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen())),
                      child: Text("Terms&Conditions", style: hyperLinkWhite(),))
                ],
              ),
            ),
            SizedBox(height: 34*coefH),
            GestureDetector(
              onTap: ()=> RegisterWithEmail().register(_name.text, _email.text, _password.text, isAgreed, context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8*coefW),
                alignment: Alignment.center,
                height: 48*coefH, width: 200*coefW,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(23.5), color: sapphire()),
                child: Text("Create Account",style: buttonFont(),),
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
            SizedBox(height: 36*coefH),
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
            SizedBox(height: 80*coefH),
            Text("Already have account?",style: bodyFont(),),
            GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),
                child: Text("Login now!",style: hyperLinkBlue(),)),
           /* TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),
                child: Text("Login now!",style: hyperLinkBlue(),))*/
          ],
        ),
      ),
    );
  }
}
