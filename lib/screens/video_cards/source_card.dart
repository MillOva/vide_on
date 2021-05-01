import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';

class SourceCard extends StatefulWidget {
  @override
  _SourceCardState createState() => _SourceCardState();
}

class _SourceCardState extends State<SourceCard> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Container(
      height: 98,
      width: 174 * coefW,
      padding: EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 98,
            width:  174 * coefW,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
          ),
        ],
      ),
    );
  }
}