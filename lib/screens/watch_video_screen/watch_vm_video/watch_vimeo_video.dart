import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WatchVimeoVideoScreen extends StatefulWidget {
  final String id;
  WatchVimeoVideoScreen({@required this.id});
  @override
  _WatchVimeoVideoScreenState createState() => _WatchVimeoVideoScreenState();
}

class _WatchVimeoVideoScreenState extends State<WatchVimeoVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
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
        url: 'https://vimeo.com/${widget.id}');
  }
}
