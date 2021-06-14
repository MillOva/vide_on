import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';

Future <void> showError(String errorText, context) async{
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;
  double coefH = _height / 896;
  double coefW = _width / 414;
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(left: 73*coefW, right: 73*coefW, top: 340*coefH, bottom: 382*coefH),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: charcoalGrey(),
              ),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 18, bottom: 24),
                    child: Text(errorText,style: bodyFont(),textAlign: TextAlign.center,),
                  ),
                  Container(height: 1, color: graphite()),
                  GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 11),
                      child: Text("OK",style: hyperLinkBlue(),),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
  );
}