import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/video_with_desc_card.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/services/video_actions/parse_tw_video.dart';

class TwitchSearchResult extends StatefulWidget {
  final String title;
  final String q;
  TwitchSearchResult({@required this.title, @required this.q});
  @override
  _TwitchSearchResultState createState() => _TwitchSearchResultState();
}

class _TwitchSearchResultState extends State<TwitchSearchResult> {
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
        "https://api.twitch.tv/kraken/search/streams?query=${widget.q}&limit=10&offset=$token", headers: headers);

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
        _nextPageToken = _nextPageToken + 10;
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
