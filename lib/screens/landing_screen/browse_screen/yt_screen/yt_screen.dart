import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/large_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/yt_screen/yt_categoty.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/yt_screen/yt_search.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:vide_on/services/video_actions/parse_yt_video.dart';
import 'package:http/http.dart' as http;

class YouTubeScreen extends StatefulWidget {
  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  String _nextPageToken = "";

  Future<List<Video>> getYTVideos(String token) async {
    var data = await http.get(
        "https://youtube.googleapis.com/youtube/v3/videos?chart=mostPopular&key=$ApiKey&part=snippet&pageToken=$token");
    var jsonData = json.decode(data.body);
    _nextPageToken = jsonData['nextPageToken'];
    for (var u in jsonData['items']) {
      Item item = Item.fromJson(u);
      _videos.add(Video.fromYT(item));
    }
    print(_videos.length);
    return _videos;
  }

  @override
  void initState() {
    _dataModel = getYTVideos(_nextPageToken);
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
        _dataModel = getYTVideos(_nextPageToken);
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
          "YouTube",
          style: headlineFont(),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: calcite(),
              ),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> YouTubeSearch())))
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
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>YTCategory(title: "Education", id: "/m/01k8wb"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 142, 29, 45)),
                  child: Row(
                    children: [
                      Icon(Icons.wb_incandescent_outlined,color: calcite(),),
                      SizedBox(width: 8),
                      Text("Education",style: buttonFont(),)
                    ],
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>YTCategory(title: "News", id: "/m/098wr"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 47, 120, 112)),
                    child: Row(
                      children: [
                        Icon(Icons.card_travel,color: calcite(),),
                        SizedBox(width: 8),
                        Text("News",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>YTCategory(title: "Sport", id: "/m/06ntj"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 183, 114, 101)),
                    child: Row(
                      children: [
                        Icon(Icons.sports_football_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Sport",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>YTCategory(title: "Movies", id: "/m/02vxn"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 183, 141, 42)),
                    child: Row(
                      children: [
                        Icon(Icons.ondemand_video_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Movies",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>YTCategory(title: "Music", id: "/m/064t9"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 16, 58, 128)),
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
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>YTCategory(title: "Gaming", id: "/m/0bzvm2"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 34, 96, 138)),
                    child: Row(
                      children: [
                        Icon(Icons.gamepad_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Gaming",style: buttonFont(),)
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
