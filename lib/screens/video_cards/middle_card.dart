import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/screens/video_cards/watch_video_screen.dart';
import 'package:vide_on/services/user.dart';

class MiddleCard extends StatefulWidget {
  final String id;
  final String source;
  final String title;
  final String author;
  final String thumbnail;
  MiddleCard({@required this.id, @required this.source, @required this.title, @required this.author, @required this.thumbnail});//@required this.ytResult
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
    final ConcreteUser user = Provider.of<ConcreteUser>(context);

    Future<void> addToWatched(String id,String source,String title,String author,String thumbnail) async{
      print("user email = ${user.email}");
      return  FirebaseFirestore.instance.collection('users')
          .doc(user.id)
          .collection("user_collections")
          .doc("watched")
          .collection("watched_videos")
          .doc(id)
          .set({
        'id': id,
        'source': source,
        'title': title,
        'author': author,
        'thumbnail': thumbnail,
        'time': Timestamp.now(),
      })
          .then((value) => print("Watched added"))
          .catchError((error) => print("Failed to add Watched: $error"));
    }

    //String _link = widget.ytResult.thumbnail['high']['url'];
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchVideoScreen(id: widget.id)));
          addToWatched(widget.id, widget.source, widget.title,widget.author,widget.thumbnail);},
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
              image: DecorationImage(image: NetworkImage(widget.thumbnail), fit: BoxFit.cover),),
            ),
            SizedBox(height: 8),
            Text(widget.title, maxLines: 1,style: bodyFont(), overflow: TextOverflow.ellipsis,),
            Text(widget.author, maxLines: 1, overflow: TextOverflow.ellipsis, style:
              TextStyle(color: Color.fromARGB(255, 91, 95, 100), fontSize: 16, fontFamily: 'CircularStdBook'),)
          ],
        ),
      ),
    );
  }
}
