import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/screens/video_cards/watch_video_screen.dart';

class SmallCard extends StatefulWidget {
  final String id;
  final String thumbnail;
  SmallCard({@required this.id, @required this.thumbnail});
  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double coefH = _height / 896;
    return Container(
      padding: EdgeInsets.only(right: 12),
      height: 98 * coefH,
      child: GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchVideoScreen(id: widget.id))),
        child: Container(
          height: 98 * coefH,
          width:  174 * coefH,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.thumbnail),fit: BoxFit.fitWidth),
            borderRadius: BorderRadius.circular(10), color: charcoalGrey(),),
        ),
      ),
    );
  }
}
