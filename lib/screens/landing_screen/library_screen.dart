import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/screens/landing_screen/browse_screen.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen.dart';
import 'package:vide_on/screens/video_cards/video_with_desc_card.dart';

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
    double coefW = _width / 414;
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
         VideoWithDescriptionCard(),
          VideoWithDescriptionCard(),
        ],
      ),
      bottomNavigationBar: Container(height: 82* coefH, width:  _width, color: charcoalGrey(),
        padding: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchNowScreen())),
              child: Column(
                children: [
                  Image.asset('assets/images/watch passive.png'),
                  SizedBox(height: 7),
                  Text("Watch",style: sfProNonActive(),)
                ],
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> BrowseScreen())),
              child: Column(
                children: [
                  Image.asset('assets/images/browse passive.png'),
                  SizedBox(height: 7),
                  Text("Browse",style: sfProNonActive(),)
                ],
              ),
            ),
            Column(
              children: [
                Image.asset('assets/images/library.png'),
                SizedBox(height: 7),
                Text("Library",style: sfProActive(),)
              ],
            ),
            GestureDetector(
              //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> BrowseScreen())),
              child: Column(
                children: [
                  Image.asset('assets/images/profile passive.png'),
                  SizedBox(height: 7),
                  Text("Profile",style: sfProNonActive(),)
                ],
              ),
            )
          ],
        ),),
    );
  }
}
