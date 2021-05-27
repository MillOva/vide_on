import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/screens/cards/source_cards/source_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/yt_screen/yt_screen.dart';
import 'package:vide_on/screens/landing_screen/library_screen/library_screen.dart';
import 'package:vide_on/screens/landing_screen/profile_screen/profile_screen.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/watch_now_screen.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: EdgeInsets.only(left: 32, top: 70, bottom: 64),
          child: Text("Browse", style: title_1Font(),),
        ),
        Expanded(
          child: GridView.count(
            childAspectRatio: 1.5,
            padding: EdgeInsets.only(left: 21),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> YouTubeScreen())),
                  child: SourceCard(source: 'assets/images/YT_Logo.png', color: Colors.white,)),
              SourceCard(source: 'assets/images/TW_Logo.png', color: Color.fromARGB(255, 121, 41, 235),),
              SourceCard(source: 'assets/images/VM_Logo.png', color: Colors.white,),
              //SourceCard(), SourceCard(), SourceCard(),
              ],),
        ),
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
                //height: 44,
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(CupertinoIcons.play_fill, color: graphite(),),
                    //Image.asset('assets/images/watch passive.png'),
                    SizedBox(height: 7),
                    Text("Watch",style: sfProNonActive(),)
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Icon(CupertinoIcons.compass_fill, color: sapphire(),),
                //Image.asset('assets/images/browse.png'),
                SizedBox(height: 7),
                Text("Browse",style: sfProActive(),)
              ],
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryScreen())),
              child: Column(
                children: [
                  //Image.asset('assets/images/library passive.png'),
                  Icon(CupertinoIcons.bookmark_fill, color: graphite(),),
                  SizedBox(height: 7),
                  Text("Library",style: sfProNonActive(),)
                ],
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())),
              child: Column(
                children: [
                  //Image.asset('assets/images/profile passive.png'),
                  Icon(Icons.person, size: 25, color: graphite(),),
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
