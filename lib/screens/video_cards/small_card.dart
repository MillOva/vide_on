import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';

class SmallCard extends StatefulWidget {
  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Container(
      padding: EdgeInsets.only(right: 12),
      height: 98 * coefH,
      child: Container(
        height: 98 * coefH,
        width:  174 * coefH,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
      ),
    );
  }
}
