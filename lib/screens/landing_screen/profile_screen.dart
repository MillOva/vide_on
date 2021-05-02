import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Container(child: Image.asset('assets/images/back.png'),)),
        backgroundColor: obsidian(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 92*coefH, width: 92*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(46*coefH), color: charcoalGrey()),),
                Container(height: 50*coefH, width: 2, color: sapphire(),),
                Container(width: 50*coefH, height: 2, color: sapphire(),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 24*coefH, bottom: 48),
              child: Text("Hello username!",style: headlineFont(),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 24*coefH),
                    child: Text("General", style: bodyFont(),)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Password",style: bodyFont(),),
                  Image.asset('assets/images/next.png')
                ],),),
                SizedBox(height: 8*coefH),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Privacy Policy",style: bodyFont(),),
                      Image.asset('assets/images/next.png')
                    ],),),
                SizedBox(height: 8*coefH),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notifications",style: bodyFont(),),
                      Image.asset('assets/images/next.png')
                    ],),),
                SizedBox(height: 8*coefH),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text("About",style: bodyFont(),),
                      Image.asset('assets/images/next.png')
                    ],),),
                Padding(
                    padding: EdgeInsets.only(left: 16,top:24*coefH, bottom: 24*coefH),
                    child: Text("Feedback", style: bodyFont(),)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Support",style: bodyFont(),),
                      Image.asset('assets/images/next.png')
                    ],),),
                SizedBox(height: 8*coefH),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bug Report",style: bodyFont(),),
                      Image.asset('assets/images/next.png')
                    ],),),
                SizedBox(height: 48*coefH),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 8),height: 44*coefH, width: double.maxFinite,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
                  child: Text("Log Out",style: bodyFont3(),),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
