import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/large_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/search_screen.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/tw_screen/tw_category.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/services/video_actions/parse_tw_video.dart';

class TwitchScreen extends StatefulWidget {
  @override
  _TwitchScreenState createState() => _TwitchScreenState();
}

class _TwitchScreenState extends State<TwitchScreen> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  int _nextPageToken = 0;

  Future<List<Video>> getTWVideos(int token) async {
    Map<String, String> headers = {
      'Accept': 'application/vnd.twitchtv.v5+json',
      'Client-ID': clientId,
    };
    var data = await http.get(
        "https://api.twitch.tv/kraken/streams/?limit=5&offset=$token", headers: headers);
    print("token = $token");
    var jsonData = json.decode(data.body);
    for (var u in jsonData['streams']) {
      Stream stream = Stream.fromJson(u);
      _videos.add(Video.fromTW(stream));
    }
    print(_videos.length);
    return _videos;
  }

  @override
  void initState() {
    _dataModel = getTWVideos(_nextPageToken);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print("reach the top");
      });
    }

    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print("bottom");
        _nextPageToken = _nextPageToken + 5;
        _dataModel = getTWVideos(_nextPageToken);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Image.asset('assets/images/back.png'),
            )),
        backgroundColor: Colors.transparent,
        title: Text(
          "Twitch",
          style: headlineFont(),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: calcite(),
              ),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen(source: "Twitch")))
          )
        ],
      ),
      body: ListView(//Column
        controller: _scrollController,
        shrinkWrap: true,
        children: [
          GridView.count(
            controller: ScrollController(),
            childAspectRatio: 3.3,
            padding: EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TWCategory(title: "Music", id: "music"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 121, 41, 235),),
                    child: Row(
                      children: [
                        Icon(Icons.music_note_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Music",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TWCategory(title: "Science", id: "Science%20%26%20Technology"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 121, 41, 235),),
                    child: Row(
                      children: [
                        Icon(Icons.wb_incandescent_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Science",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TWCategory(title: "Sports", id: "sports"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 121, 41, 235),),
                    child: Row(
                      children: [
                        Icon(Icons.sports_football_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Sports",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TWCategory(title: "IRL", id: "Just%20Chatting"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 121, 41, 235),),
                    child: Row(
                      children: [
                        Icon(Icons.mic_none_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("IRL",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
            ],),
          SizedBox(height: 12),
          FutureBuilder(
              future: _dataModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    //height: 500,
                    child: ListView.builder(
                        controller: ScrollController(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return LargeCard(video: snapshot.data[index]);
                        }),
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }
}
