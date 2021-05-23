import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/large_card.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:vide_on/services/user/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vide_on/services/video_actions/parse_tw_video.dart';
import 'package:vide_on/services/video_actions/parse_vm_video.dart';
import 'package:vide_on/services/video_actions/parse_yt_video.dart';

class FeedContainer extends StatefulWidget {
  final double height;
  FeedContainer({@required this.height});
  @override
  _FeedContainerState createState() => _FeedContainerState();
}

class _FeedContainerState extends State<FeedContainer> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];

  Future<List<Video>> getYTVideos() async {
    var data = await http.get(
        "https://youtube.googleapis.com/youtube/v3/videos?chart=mostPopular&key=$ApiKey&part=snippet");
    var jsonData = json.decode(data.body);
    for (var u in jsonData['items']) {
      Item item = Item.fromJson(u);
      _videos.add(Video.fromYT(item));
    }
    print(_videos.length);
    return _videos;
  }

  Future<List<Video>> getTWVideos() async {
    Map<String, String> headers = {
      'Accept': 'application/vnd.twitchtv.v5+json',
      'Client-ID': clientId,
    };
    var data = await http.get(
        "https://api.twitch.tv/kraken/streams/?limit=5", headers: headers);
    var jsonData = json.decode(data.body);
    for (var u in jsonData['streams']) {
      Stream stream = Stream.fromJson(u);
      _videos.add(Video.fromTW(stream));
    }
    print(_videos.length);
    return _videos;
  }

  Future<List<Video>> getVMVideos() async {
    Map<String, String> headers = {
      'Authorization': 'bearer $access_token',
    };
    var data = await http.get(
        "https://api.vimeo.com/categories/travel/videos?per_page=5", headers: headers);
    var jsonData = json.decode(data.body);

    for(var u in jsonData['data']) {
     Datum datum = Datum.fromJson(u);
      _videos.add(Video.fromVM(datum));
    }
    print(_videos.length);
    return _videos;
  }

  @override
  void initState() {
    _dataModel = getYTVideos();
    _dataModel = getTWVideos();
    _dataModel = getVMVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    return FutureBuilder(
        future: _dataModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              height: widget.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return LargeCard(video: snapshot.data[index]);
                  }),
            );
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
