import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/video_with_desc_card.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/services/video_actions/parse_vm_video.dart';

class VimeoSearchResult extends StatefulWidget {
  final String title;
  final String q;
  VimeoSearchResult({@required this.title, @required this.q});
  @override
  _VimeoSearchResultState createState() => _VimeoSearchResultState();
}

class _VimeoSearchResultState extends State<VimeoSearchResult> {

  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  String _nextPageToken = "";

  Future<List<Video>> getVMVideos(String paging) async {
    Map<String, String> headers = {
      'Authorization': 'bearer $access_token',
    };
    var data = await http.get(
        "https://api.vimeo.com/videos?per_page=10&query=${widget.q}&paging=$paging", headers: headers);
    var jsonData = json.decode(data.body);
    VimeoVideo video = VimeoVideo.fromJson(jsonData);
    _nextPageToken = video.paging.next;
    for(var u in jsonData['data']) {
      Datum datum = Datum.fromJson(u);
      _videos.add(Video.fromVM(datum));
    }
    print(_videos.length);
    return _videos;
  }

  @override
  void initState() {
    _dataModel = getVMVideos(_nextPageToken);
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
        _dataModel = getVMVideos(_nextPageToken);
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
