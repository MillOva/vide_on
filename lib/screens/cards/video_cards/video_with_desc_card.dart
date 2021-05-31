import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_tw_video/watch_twitch_video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_vm_video/watch_vimeo_video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_yt_video/watch_youtube_video_screen.dart';

class VideoWithDescriptionCard extends StatefulWidget {
  final Video video;
  VideoWithDescriptionCard({@required this.video});
  @override
  _VideoWithDescriptionCardState createState() => _VideoWithDescriptionCardState();
}

class _VideoWithDescriptionCardState extends State<VideoWithDescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.video.source == "YouTube")
          Navigator.push(context, MaterialPageRoute(builder: (context) => WatchYouTubeVideoScreen(id: widget.video.id)));
        if(widget.video.source == "Twitch")
          Navigator.push(context, MaterialPageRoute(builder: (context) => WatchTwitchVideoScreen(id: widget.video.id)));
        if(widget.video.source == "Vimeo")
          Navigator.push(context, MaterialPageRoute(builder: (context) => WatchVimeoVideoScreen(id: widget.video.id)));
      },
      child: Container(
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
      ),
    );
  }
}
