import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/tw_screen/tw_search_result.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/vm_screen/vm_search_result.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/yt_screen/yt_search_result.dart';

class SearchScreen extends StatefulWidget {
  final String source;
  SearchScreen({@required this.source});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textController = TextEditingController();
  List<String> _videos = [];
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
                  //_videos.clear();
                });
              })
        ],
      ),
      body: Container(
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  switch(widget.source){
                    case "YouTube": Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        YouTubeSearchResult(title: "YouTube", q: _textController.text))); break;
                    case "Twitch": Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        TwitchSearchResult(title: "Twitch", q: _textController.text))); break;
                    case "Vimeo": Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        VimeoSearchResult(title: "Vimeo", q: _textController.text))); break;
                  }
                },
                child: Container(
                  height: 64,
                  color: obsidian(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(children: [
                            Icon(Icons.search_rounded, color: graphite(),),
                            SizedBox(width: 8),
                            _videos.length > 5
                                ?
                            Text(_videos[_videos.length - index - 1],style: bodyFont(),
                              maxLines: 1,
                              //softWrap: true,
                              overflow: TextOverflow.ellipsis, )
                                :
                            Text(_videos[index],style: bodyFont(),
                              maxLines: 1,
                              //softWrap: true,
                              overflow: TextOverflow.ellipsis, ),
                          ],),
                        ),
                        IconButton(icon: Icon(CupertinoIcons.arrow_up_left, color: graphite(),), color: calcite(),
                            onPressed: ()=> setState((){_textController.text = _videos[index];})),
                      ]),),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: graphite(),
            ),
            itemCount: _videos.length > 5 ? 5 : _videos.length),
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
        onChanged: (string)=> string =="" ? setState((){_videos.clear();}) : setState((){_videos.add(string);}),

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
