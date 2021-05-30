import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/screens/cards/video_cards/video_with_desc_card.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:vide_on/services/video_actions/parse_yt_search_video.dart';

class YouTubeSearchResult extends StatefulWidget {
  final String title;
  final String q;
  YouTubeSearchResult({@required this.title, @required this.q});
  @override
  _YouTubeSearchResultState createState() => _YouTubeSearchResultState();
}

class _YouTubeSearchResultState extends State<YouTubeSearchResult> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  String _nextPageToken = "";

  Future<List<Video>> getYTVideos(String token) async {
    var data = await http.get(
        "https://youtube.googleapis.com/youtube/v3/search?q=${widget.q}&key=$ApiKey&part=snippet&pageToken=$token&maxResults=10");
    var jsonData = json.decode(data.body);
    _nextPageToken = jsonData['nextPageToken'];
    for (var u in jsonData['items']) {
      print(u);
      Item item = Item.fromJson(u);
      _videos.add(Video.fromYTSearch(item));
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
          "${widget.title} search results",
          style: headlineFont(),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _dataModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                alignment: Alignment.topLeft,
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return VideoWithDescriptionCard(video: snapshot.data[index]);
                    }),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
      ),
    );
  }
}
