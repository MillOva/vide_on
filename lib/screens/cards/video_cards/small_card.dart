import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/watch_video_screen/watch_yt_video/watch_youtube_video_screen.dart';
import 'package:vide_on/services/user/user.dart';
import 'package:vide_on/services/video_actions/video_actions.dart';

class SmallCard extends StatefulWidget {
  final Video video;
  SmallCard({@required this.video});
  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double coefH = _height / 896;
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    return Container(
      padding: EdgeInsets.only(right: 12),
      height: 98 * coefH,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WatchVideoScreen(id: widget.video.id)));
          addToWatched(widget.video, _user);
        },
        child: Container(
          height: 98 * coefH,
          width:  174 * coefH,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.video.thumbnailUrl),fit: BoxFit.fitWidth),
            borderRadius: BorderRadius.circular(10), color: charcoalGrey(),),
        ),
      ),
    );
  }
}
