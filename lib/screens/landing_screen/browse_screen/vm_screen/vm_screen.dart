import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/large_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/vm_screen/vm_category.dart';
import 'package:vide_on/services/keys/keys.dart';
import 'package:vide_on/services/video_actions/parse_vm_video.dart';
import 'package:http/http.dart' as http;

class VimeoScreen extends StatefulWidget {
  @override
  _VimeoScreenState createState() => _VimeoScreenState();
}

class _VimeoScreenState extends State<VimeoScreen> {
  Future<List<Video>> _dataModel;
  List<Video> _videos = [];
  ScrollController _scrollController = ScrollController();
  String _nextPageToken = "";

  Future<List<Video>> getVMVideos(String paging) async {
    Map<String, String> headers = {
      'Authorization': 'bearer $access_token',
    };
    var data = await http.get(
        "https://api.vimeo.com/categories/travel/videos?per_page=5&paging=$paging", headers: headers);
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
          "Vimeo",
          style: headlineFont(),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: calcite(),
              ),
          ),//onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> YouTubeSearch())))
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
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VMCategory(title: "Instructionals", id: "instructionals"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 25, 183, 234)),
                    child: Row(
                      children: [
                        Icon(Icons.wb_incandescent_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Instructionals",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VMCategory(title: "Journalism", id: "journalism"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 25, 183, 234)),
                    child: Row(
                      children: [
                        Icon(Icons.card_travel,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Journalism",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VMCategory(title: "Sports", id: "sports"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 25, 183, 234)),
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
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VMCategory(title: "Documentary", id: "documentary"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 25, 183, 234)),
                    child: Row(
                      children: [
                        Icon(Icons.ondemand_video_outlined,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Documentary",style: buttonFont(),)
                      ],
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VMCategory(title: "Music", id: "music"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 25, 183, 234)),
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
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>VMCategory(title: "Art", id: "art"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 25, 183, 234)),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.sparkles,color: calcite(),),
                        SizedBox(width: 8),
                        Text("Art",style: buttonFont(),)
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
