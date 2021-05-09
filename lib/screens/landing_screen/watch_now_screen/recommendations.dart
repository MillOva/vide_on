import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/screens/video_cards/middle_card.dart';


class RecommendationsContainer extends StatefulWidget {
  final double height;

  RecommendationsContainer({@required this.height});
  @override
  _RecommendationsContainerState createState() => _RecommendationsContainerState();
}

class _RecommendationsContainerState extends State<RecommendationsContainer> {

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('popular').snapshots(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        //getRecommendations();
        return Text("Loading");
      }

      return Container(
        padding: EdgeInsets.only(left: 32),
        height: widget.height+8,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.docs.length,//ytResult.length,
          itemBuilder:  (context, index) {
            return MiddleCard(id: snapshot.data.docs[index]['videoID'],
              source: snapshot.data.docs[index]['source'], title: snapshot.data.docs[index]['title'],
                author: snapshot.data.docs[index]['author'], thumbnail: snapshot.data.docs[index]['thumbnail'],);
              //MiddleCard(ytResult: ytResult[index]);
          },
        ),
      );
    });
  }
}
