import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';

class VideoWithDescriptionCard extends StatefulWidget {
  @override
  _VideoWithDescriptionCardState createState() => _VideoWithDescriptionCardState();
}

class _VideoWithDescriptionCardState extends State<VideoWithDescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 98, width: 174, color: charcoalGrey(),),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("title",style: bodyFont(), maxLines: 2, overflow: TextOverflow.visible),
            SizedBox(height: 4),
            Text("subtitle",style: bodyFont2(), maxLines: 2, overflow: TextOverflow.visible)
          ],)
        ],
      ),
    );
  }
}
