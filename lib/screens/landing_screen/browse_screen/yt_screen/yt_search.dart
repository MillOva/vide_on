import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:vide_on/services/keys/keys.dart';

class YouTubeSearch extends StatefulWidget {
  @override
  _YouTubeSearchState createState() => _YouTubeSearchState();
}

class _YouTubeSearchState extends State<YouTubeSearch> {
  TextEditingController _textController = TextEditingController();
  Future<List<String>> _dataModel;
  List<String> _videos = [];

  Future<List<String>> getYTSearch(String q) async {
    _videos.clear();
    var data = await http.get(
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=$ApiKey&q=$q");
    var jsonData = json.decode(data.body);
    for (var u in jsonData['items']) {
      print(u);
      _videos.add(u['snippet']['title']);
      setState(() {

      });
    }
    print(_videos.length);
    return _videos;
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
        title: input(),

        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.xmark,
                color: calcite(),
              ),
              onPressed: () {
                setState(() {
                  _textController.clear();
                  _videos.clear();
                });
              })
        ],
      ),
      body: Container(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()=> print("go to video page"),
                child: Container(
                  height: 64,
                  color: obsidian(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.search_rounded, color: graphite(),),
                          SizedBox(width: 8),
                          Text(_videos[index],style: bodyFont(),),
                        ],),
                    IconButton(icon: Icon(CupertinoIcons.arrow_up_left, color: graphite(),), color: calcite(),
                        onPressed: ()=> setState((){_textController.text = _videos[index];})),
                  ]),),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: graphite(),
            ),
            itemCount: _videos.length),
      ),
    );
  }
  Widget input() {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.bottomLeft,
      child: TextField(
        controller: _textController,
        obscureText: false,
        keyboardType: TextInputType.text,
        style: bodyFont(),
        onChanged: (string)=> string =="" ? setState((){_videos.clear();}) :_dataModel = getYTSearch(string),

        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          isCollapsed: true,
          hintStyle: bodyFont(),
          hintText: "Search",
        ),
      ),
    );
  }
}
