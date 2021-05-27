import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/screens/cards/video_cards/large_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/yt_screen/yt_search.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:vide_on/services/video_actions/parse_yt_category.dart';

class YTCategory extends StatefulWidget {
  final String title;
  final String id;
  YTCategory({@required this.title, @required this.id});
  @override
  _YTCategoryState createState() => _YTCategoryState();
}

class _YTCategoryState extends State<YTCategory> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  String _nextPageToken = "";

  Future<List<Video>> getYTVideos(String token) async {
    var data = await http.get(
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&topicId=${widget.id}&regionCode=us&key=$ApiKey&pageToken=$token");
    var jsonData = json.decode(data.body);
    _nextPageToken = jsonData['nextPageToken'];
    for (var u in jsonData['items']) {

      Item item = Item.fromJson(u);

      _videos.add(Video.fromYTCategory(item));
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
