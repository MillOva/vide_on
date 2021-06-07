import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/global/custom_widgets/profile_pic_container.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/browse_screen.dart';
import 'package:vide_on/screens/landing_screen/library_screen/library_screen.dart';
import 'package:vide_on/screens/landing_screen/profile_screen/profile_screen.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/continue_watch.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/feed.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/recommendations.dart';

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
        controller: ScrollController(),
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watch Now",
                  style: title_1Font(),
                ),
                ProfilePictureContainer(),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 32, top: 32, bottom: 24),
              child: Text(
                "Recommendations",
                style: headlineFont(),
              )),
          RecommendationsContainer(height: 190 * coefH),
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 32 * coefW, vertical: 16),
              child: Container(
                height: 1,
                color: charcoalGrey(),
              )),
          Padding(
              padding: EdgeInsets.only(left: 32, bottom: 24),
              child: Text(
                "Continue to watch",
                style: headlineFont(),
              )),
          ContinueWatchContainer(height: 98 * coefH),
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 32 * coefW, vertical: 24),
              child: Container(
                height: 1,
                color: charcoalGrey(),
              )),
          FeedContainer(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 82 * coefH,
        width: _width,
        color: charcoalGrey(),
        padding: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 44,
              color: charcoalGrey(),
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.play_fill,
                    color: sapphire(),
                  ),
                  //Image.asset('assets/images/watch.png'),
                  SizedBox(height: 7),
                  Text(
                    "Watch",
                    style: sfProActive(),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BrowseScreen())),
              child: Container(
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.compass,
                      color: graphite(),
                    ),
                    //Image.asset('assets/images/browse passive.png'),
                    SizedBox(height: 7),
                    Text(
                      "Browse",
                      style: sfProNonActive(),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LibraryScreen())),
              child: Container(
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.bookmark,
                      color: graphite(),
                    ),
                    //Image.asset('assets/images/library passive.png'),
                    SizedBox(height: 7),
                    Text(
                      "Library",
                      style: sfProNonActive(),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen())),
              child: Container(
                width: 44,
                color: charcoalGrey(),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.profile_circled,
                      size: 25,
                      color: graphite(),
                    ),
                    //Image.asset('assets/images/profile passive.png'),
                    SizedBox(height: 7),
                    Text(
                      "Profile",
                      style: sfProNonActive(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
