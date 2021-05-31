import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/screens/cards/video_cards/video_with_desc_card.dart';
import 'package:vide_on/screens/landing_screen/browse_screen/browse_screen.dart';
import 'package:vide_on/screens/landing_screen/profile_screen/profile_screen.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/watch_now_screen.dart';
import 'package:vide_on/services/user/user.dart';
import 'package:vide_on/services/video_actions/video_actions.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  ScrollController _controller = ScrollController();
  bool _isActiveFavourites = true;

  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                     onTap: () {if(_isActiveFavourites == true)setState((){_isActiveFavourites = false;});},
                      child: Text("History", style: _isActiveFavourites ? title_2Font() : title_1Font(),)),
                    SizedBox(height: 4),
                    Container(height: 1, width: 90, color: _isActiveFavourites ? Colors.transparent : sapphire())
                  ],
                ),
              ],
            ),
          ),
         _isActiveFavourites ? Expanded(
           child: StreamBuilder<QuerySnapshot>(
           stream: FirebaseFirestore.instance.collection('users').doc('${_user.id}').collection('user_collections')
               .doc('favourites').collection('favourite_videos').orderBy('time',descending: true).snapshots(),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (snapshot.hasError) {
           return Text('Something went wrong');
           }

           if (snapshot.connectionState == ConnectionState.waiting) {
           return Text("Loading");
           }

           return Container(
        // padding: EdgeInsets.only(left: 32),
           //height: widget.height+8,
           child: ListView.builder(
           controller: _controller,
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           itemCount: snapshot.data.docs.length,//ytResult.length,
           itemBuilder:  (context, index) {
           return  Stack(
               children: [
               VideoWithDescriptionCard(video: Video.fromMap(snapshot.data.docs[index])),
                 Positioned(
                   right: 4, top: 8,
                   child: GestureDetector(
                     onTap: ()=> setState((){
                       removeFavourites(Video.fromMap(snapshot.data.docs[index]), _user);
                     }),
                     child: Container(
                       height: 35, width: 35,
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                         color: obsidian(),
                         //border: Border.all(color: sapphire())
                       ),
                       child: Center(child: Icon(CupertinoIcons.heart_fill , color: sapphire(),)),
                     ),
                   ),
                 )
             ]);
           },),);
           }),
         )
         : Expanded(
           child: StreamBuilder<QuerySnapshot>(
               stream: FirebaseFirestore.instance.collection('users').doc(_user.id).collection('user_collections')
                   .doc('watched').collection('watched_videos').orderBy('time',descending: true).snapshots(),
               builder: (BuildContext context, AsyncSnapshot snapshot) {
                 if (snapshot.hasError) {
                   return Text('Something went wrong');
                 }

                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return Text("Loading");
                 }

                 return snapshot.data.docs.length>0 ? Container(
                   child: ListView.builder(
                     controller: _controller,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     itemCount: snapshot.data.docs.length,//ytResult.length,
                     itemBuilder:  (context, index) {
                       return VideoWithDescriptionCard(video: Video.fromMap(snapshot.data.docs[index]));
                     },
                   ),
                 )
                     : Center(child: Text("Nothing here yet :(",style: bodyFont(),));
               })
         )
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
