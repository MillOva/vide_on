import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_yt_video/watch_youtube_video_screen.dart';
import 'package:vide_on/services/user/user.dart';
import 'package:vide_on/services/video_actions/video_actions.dart';

class MiddleCard extends StatefulWidget {
  final Video video;
  MiddleCard({@required this.video});
  @override
  _MiddleCardState createState() => _MiddleCardState();
}

class _MiddleCardState extends State<MiddleCard> {

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchVideoScreen(id: widget.video.id)));
          addToWatched(widget.video, _user);},
      child: Container(
        width:  240 * coefW,
        padding: EdgeInsets.only(right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 135 * coefH,
              width:  240 * coefW,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: charcoalGrey(),
              image: DecorationImage(image: NetworkImage(widget.video.thumbnailUrl), fit: BoxFit.cover),),
            ),
            SizedBox(height: 8),
            Text(widget.video.title, maxLines: 1,style: bodyFont(), overflow: TextOverflow.ellipsis,),
            Text(widget.video.channelTitle, maxLines: 1, overflow: TextOverflow.clip, style:
              TextStyle(color: Color.fromARGB(255, 91, 95, 100), fontSize: 16, fontFamily: 'CircularStdBook'),)
          ],
        ),
      ),
    );
  }
}
