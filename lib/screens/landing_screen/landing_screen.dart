import 'package:flutter/material.dart';
import 'package:vide_on/global/colors.dart';
import 'package:vide_on/global/fonts.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Scaffold(
      body: Container(
        height:  _height, width: _width, color: obsidian(),
        child: ListView(
          children: [
            Row(children: [
              Text("watch Now",style: bodyFont(),), Container(height: 50, width: 50, color: calcite(),)
            ],)
          ],
        ),
      ),
    );
  }
}
