import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/video_with_desc_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/browse_screen.dart';
import 'package:vide_on/screens/landing_screen/profile_screen/profile_screen.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/watch_now_screen.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool _isActiveFavourites = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 32, top: 70, bottom: 12),
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){ if(_isActiveFavourites == false)setState((){_isActiveFavourites = true;});},
                        child: Text("Favourites", style: _isActiveFavourites ? title_1Font() : title_2Font(),)),
                    SizedBox(height: 4),
                    Container(height: 1, width: 125, color: _isActiveFavourites ? sapphire() : Colors.transparent)
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  children: [
                    GestureDetector(
                     onTap: () {if(_isActiveFavourites == true)setState((){_isActiveFavourites = false;});},
                      child: Text("Saved", style: _isActiveFavourites ? title_2Font() : title_1Font(),)),
                    SizedBox(height: 4),
                    Container(height: 1, width: 73, color: _isActiveFavourites ? Colors.transparent : sapphire())
                  ],
                ),
              ],
            ),
          ),
         VideoWithDescriptionCard(video: Video(id: "2zhi3FmTUFg", title: "SLAYER - You Against You (OFFICIAL MUSIC VIDEO)", thumbnailUrl:"https://img.youtube.com/vi/2zhi3FmTUFg/0.jpg", channelTitle: "Slayer",source: "YouTube")),
          VideoWithDescriptionCard(video: Video(id: "2zhi3FmTUFg", title: "SLAYER - You Against You (OFFICIAL MUSIC VIDEO)", thumbnailUrl:"https://img.youtube.com/vi/2zhi3FmTUFg/0.jpg", channelTitle: "Slayer",source: "YouTube")),
        ],
      ),
      bottomNavigationBar: Container(height: 82* coefH, width:  _width, color: charcoalGrey(),
        padding: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchNowScreen())),
              child: Container(
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(CupertinoIcons.play, color: graphite(),),
                    //Image.asset('assets/images/watch passive.png'),
                    SizedBox(height: 7),
                    Text("Watch",style: sfProNonActive(),)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> BrowseScreen())),
              child: Container(
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(CupertinoIcons.compass, color: graphite(),),
                    //Image.asset('assets/images/browse passive.png'),
                    SizedBox(height: 7),
                    Text("Browse",style: sfProNonActive(),)
                  ],
                ),
              ),
            ),
            Container(
              width: 44,
              color: charcoalGrey(),
              child: Column(
                children: [
                  //Image.asset('assets/images/library.png'),
                  Icon(CupertinoIcons.bookmark_fill, color: sapphire(),),
                  SizedBox(height: 7),
                  Text("Library",style: sfProActive(),)
                ],
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())),
              child: Container(
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(CupertinoIcons.profile_circled, size: 25, color: graphite(),),
                    //Image.asset('assets/images/profile passive.png'),
                    SizedBox(height: 7),
                    Text("Profile",style: sfProNonActive(),)
                  ],
                ),
              ),
            )
          ],
        ),),
    );
  }
}
