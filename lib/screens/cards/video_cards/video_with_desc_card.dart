import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';

class VideoWithDescriptionCard extends StatefulWidget {
  final Video video;
  VideoWithDescriptionCard({@required this.video});
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
          Container(height: 98, width: 174, color: charcoalGrey(),
          child: Image.network(widget.video.thumbnailUrl,fit: BoxFit.cover,),),
          SizedBox(width: 15),
          Container(
            width: 136,
            height: 98,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(widget.video.title,style: bodyFont(), maxLines: 2, overflow: TextOverflow.ellipsis),
              SizedBox(height: 4),
              Text(widget.video.channelTitle,style: bodyFont2(), maxLines: 2, overflow: TextOverflow.ellipsis)
            ],),
          )
        ],
      ),
    );
  }
}
