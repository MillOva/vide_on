import 'package:flutter/cupertino.dart';
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
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    if(_user != null){
      for(var u in _user.favourites){
        if(u == widget.video.id){
            _isFavourite = true;
        }
      }
    }
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
            Stack(
              children: [
              Container(
                height: 197 * coefH,
                width:  350 * coefW,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1),
                    image: DecorationImage(image: NetworkImage(widget.video.thumbnailUrl),
                        fit: BoxFit.cover),
                    color: charcoalGrey()),
              ),
              Positioned(
                right: 8, top: 8,
                child: GestureDetector(
                  onTap: ()=> setState((){
                    _isFavourite = !_isFavourite;
                    changeFavourites(_isFavourite, widget.video, _user);
                  }),
                  child: Container(
                    height: 35, width: 35,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: obsidian(),
                    //border: Border.all(color: sapphire())
                    ),
                    child: Center(child: Icon(_isFavourite ? CupertinoIcons.heart_fill :CupertinoIcons.heart, color: sapphire(),)),
                  ),
                ),
              )
        ]
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
