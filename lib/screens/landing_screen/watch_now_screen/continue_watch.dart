import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/small_card.dart';
import 'package:vide_on/services/user/user.dart';

class ContinueWatchContainer extends StatefulWidget {
  final double height;

  ContinueWatchContainer({@required this.height});
  @override
  _ContinueWatchContainerState createState() => _ContinueWatchContainerState();
}

class _ContinueWatchContainerState extends State<ContinueWatchContainer> {

  @override
  Widget build(BuildContext context) {
    final ConcreteUser user = Provider.of<ConcreteUser>(context);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.id).collection('user_collections')
            .doc('watched').collection('watched_videos').orderBy('time',descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            //getRecommendations();
            return Text("Loading");
          }

          return snapshot.data.docs.length>0 ? Container(
            padding: EdgeInsets.only(left: 32),
            height: widget.height+8,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length < 8 ? snapshot.data.docs.length : 8,
              itemBuilder:  (context, index) {
                return
                SmallCard(video: Video.fromMap(snapshot.data.docs[index]),);
                //MiddleCard(ytResult: ytResult[index]);
              },
            ),
          )
          : Center(child: Text("Nothing here yet :(",style: bodyFont(),));
        });
  }
}
