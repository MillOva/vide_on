import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';

class LargeCard extends StatefulWidget {
  final Video video;
  LargeCard({@required this.video});
  @override
  _LargeCardState createState() => _LargeCardState();
}

class _LargeCardState extends State<LargeCard> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return GestureDetector(
     // onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchTwitchVideoScreen(id: "1027680776"))),
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
