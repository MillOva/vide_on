import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/screens/landing_screen/browse_screen.dart';
import 'package:vide_on/screens/landing_screen/library_screen.dart';
import 'package:vide_on/screens/video_cards/large_card.dart';
import 'package:vide_on/screens/video_cards/middle_card.dart';
import 'package:vide_on/screens/video_cards/small_card.dart';


class WatchNowScreen extends StatefulWidget {
  @override
  _WatchNowState createState() => _WatchNowState();
}

class _WatchNowState extends State<WatchNowScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double coefH = _height / 896;
    double coefW = _width / 414;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Watch Now",style: title_1Font(),),
                Container(height: 50, width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: calcite(),),)
            ],),
          ),
          Padding(
              padding: EdgeInsets.only(left: 32, top: 32, bottom: 24),
              child: Text("Popular", style: headlineFont(),)),
          Container(
            padding: EdgeInsets.only(left: 32),
            height: 189.3*coefH,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                MiddleCard(), MiddleCard(), MiddleCard(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32*coefW, vertical: 16),
              child: Container(height: 1,color: charcoalGrey(),)),
          Padding(
              padding: EdgeInsets.only(left: 32, bottom: 24),
              child: Text("Continue to watch", style: headlineFont(),)),
          Container(
            padding: EdgeInsets.only(left: 32),
            height: 98 * coefH,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SmallCard(), SmallCard(), SmallCard(), SmallCard(),
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32*coefW, vertical: 24),
              child: Container(height: 1,color: charcoalGrey(),)),
          Align(child: LargeCard()),

        ],
      ),
      bottomNavigationBar: Container(height: 82* coefH, width:  _width, color: charcoalGrey(),
        padding: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/images/watch.png'),
                SizedBox(height: 7),
                Text("Watch",style: sfProActive(),)
              ],
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
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryScreen())),
              child: Column(
                children: [
                  Image.asset('assets/images/library passive.png'),
                  SizedBox(height: 7),
                  Text("Library",style: sfProNonActive(),)
                ],
              ),
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
