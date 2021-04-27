import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  final double width;
  Logo({Key key, @required this.height, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: Image.asset('assets/images/logo.png',fit: BoxFit.fill,),
    );
  }
}
