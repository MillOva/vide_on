import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_tw_video/watch_twitch_video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_vm_video/watch_vimeo_video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_yt_video/watch_youtube_video_screen.dart';
import 'package:vide_on/services/user/user.dart';
import 'package:vide_on/services/video_actions/video_actions.dart';

class LargeCard extends StatefulWidget {
  final Video video;
  LargeCard({@required this.video});
  @override
  _LargeCardState createState() => _LargeCardState();
}

class _LargeCardState extends State<LargeCard> {
  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return GestureDetector(
      onTap: ()
    {
      if(widget.video.source == "YouTube")
        //print(widget.video.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => WatchYouTubeVideoScreen(id: widget.video.id)));
      if(widget.video.source == "Twitch")
        //print(widget.video.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => WatchTwitchVideoScreen(id: widget.video.id)));
      if(widget.video.source == "Vimeo")
        //print(widget.video.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => WatchVimeoVideoScreen(id: widget.video.id)));
      addToWatched(widget.video, _user);
      },
      child: Container(
        width:  350 * coefW,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 197 * coefH,
              width:  350 * coefW,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(widget.video.thumbnailUrl),
                      fit: BoxFit.cover),
                  color: charcoalGrey()),
            ),
            SizedBox(height: 8),
            Text(widget.video.title, maxLines: 1,style: bodyFont(), overflow: TextOverflow.ellipsis,),
            Text(widget.video.channelTitle,maxLines: 1, overflow: TextOverflow.ellipsis, style:
            TextStyle(color: Color.fromARGB(255, 91, 95, 100), fontSize: 16, fontFamily: 'CircularStdBook'),),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
