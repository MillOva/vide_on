import 'package:flutter/material.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/colors.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/fonts.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final double height;
  final double width;
  final bool obscure;
  final TextInputType textInputType;
  CustomInput(
      {Key key, @required this.hint, this.controller, this.height, this.width, this.obscure, this.textInputType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,//TextInputType.number,
        style: bodyFont(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          isCollapsed: true,
          hintStyle: bodyFont(),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: calcite(), width: 1),
          ),
        ),
      ),
    );
  }
}
