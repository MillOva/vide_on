import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchYouTubeVideoScreen extends StatefulWidget {
  final String id;

  WatchYouTubeVideoScreen({@required this.id});

  @override
  _WatchYouTubeVideoScreenState createState() => _WatchYouTubeVideoScreenState();
}

class _WatchYouTubeVideoScreenState extends State<WatchYouTubeVideoScreen> {


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
        backgroundColor: Colors.transparent,
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
