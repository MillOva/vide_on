import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final String id;

  WatchVideoScreen({@required this.id});

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {


  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: widget.id,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              Navigator.pop(context);
            },
            child: Container(child: Image.asset('assets/images/back.png'),)),
        backgroundColor: obsidian(),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
        builder: (context, player){
          return player;
        }
      ),
    );
  }
}
