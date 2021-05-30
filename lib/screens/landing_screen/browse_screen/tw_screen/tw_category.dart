import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/screens/cards/video_cards/large_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/yt_screen/yt_search.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:vide_on/services/video_actions/parse_tw_video.dart';

class TWCategory extends StatefulWidget {
  final String title;
  final String id;
  TWCategory({@required this.title, @required this.id});
  @override
  _TWCategoryState createState() => _TWCategoryState();
}

class _TWCategoryState extends State<TWCategory> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  int _nextPageToken = 0;

  Future<List<Video>> getTWVideos(int offset) async {
    Map<String, String> headers = {
      'Accept': 'application/vnd.twitchtv.v5+json',
      'Client-ID': clientId,
    };
    var data = await http.get(
        "https://api.twitch.tv/kraken/streams/?game=${widget.id}&limit=5&offset=$offset", headers: headers);
    print("token = $offset");
    var jsonData = json.decode(data.body);
    for (var u in jsonData['streams']) {
      //print(u);
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
          widget.title,
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
      body: FutureBuilder(
          future: _dataModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                //height: 500,
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return LargeCard(video: snapshot.data[index]);
                    }),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
