import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchTwitchVideoScreen extends StatefulWidget {
  WatchTwitchVideoScreen({Key key, this.id}) : super(key: key);

  final String id;

  @override
  _WatchTwitchVideoScreenState createState() => _WatchTwitchVideoScreenState();
}

class _WatchTwitchVideoScreenState extends State<WatchTwitchVideoScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

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
        url: 'https://www.twitch.tv/${widget.id}');
  }
  /*    Scaffold(appBar: AppBar(
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
      body: Container(
        child: WebView(
        initialUrl: 'https://www.twitch.tv/${widget.id}',
          javascriptMode: JavascriptMode.unrestricted,
        )
         /* child: WebView(
            initialUrl: 'https://www.twitch.tv/${widget.id}',
            javascriptMode: JavascriptMode.unrestricted,
          )*/
        //child:
       // Text("https://www.twitch.tv/${widget.id}", style: bodyFont(),),
      ),
    );
  }*/
  /*{
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
        url: 'https://www.twitch.tv/${widget.id}',);

  }*/
}
  /*
  final _twitchClient =
  TwitchClient(clientId: clientId, redirectUri: redirectUri);
  final _flutterWebviewPlugin = FlutterWebviewPlugin();

  void _urlListener(String url) {
    if (url.startsWith(redirectUri)) {
      _twitchClient.initializeToken(TwitchToken.fromUrl(url));
      _flutterWebviewPlugin.close();
    }
  }

  // First authentication through a webview
  Future<TwitchToken> _openConnectionPage(
      {List<TwitchApiScope> scopes = const []}) {
    _flutterWebviewPlugin.onUrlChanged.listen(_urlListener);
    _flutterWebviewPlugin.onDestroy.listen((_) => Navigator.pop(context));

    // Get authorization URL for the connection with the webview.
    final url = _twitchClient.authorizeUri(scopes);

    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebviewScaffold(url: url.toString()),
      ),
    ).then((_) => _twitchClient.validateToken());
  }

  @override
  void initState() {
    super.initState();

    if (_twitchClient.accessToken == null) {
      WidgetsBinding.instance.scheduleFrameCallback((_) {
        _openConnectionPage(scopes: [
          TwitchApiScope.channelEditCommercial,
          TwitchApiScope.analyticsReadExtensions,
          TwitchApiScope.analyticsReadGames,
          TwitchApiScope.userReadEmail,
          TwitchApiScope.channelReadSubscriptions,
          TwitchApiScope.bitsRead,
        ]).then((value) => setState(() {}));
      });
    }
  }

  void _displayDataAlert(
      String method,
      String data, {
        bool isImg = false,
        bool isOnline,
      }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(method),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isOnline != null)
                Text(
                  isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    color: isOnline ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              !isImg ? Text(data) : Image.network(data),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _twitchClient.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> headers = {
      'Accept': 'application/vnd.twitchtv.v5+json',
      'Authorization': 'Bearer ${_twitchClient.accessToken.token}',
      'Client-ID': '$clientId',
    };

    return WebviewScaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Container(child: Image.asset('assets/images/back.png'),)),
        title: Text(widget.title),
      ),
            headers: headers,
            url: 'https://api.twitch.tv/helix/videos?id=1013908058');//'https://api.twitch.tv/kraken/videos/1013908058');

     /* ListView(
        children: <Widget>[
          Text('Welcome user: ${_twitchClient.accessToken?.userId}'),
          Text('Your Twitch token is: ${_twitchClient.accessToken?.token}'),
          ElevatedButton(
            onPressed: () => _twitchClient
                .startCommercial(_twitchClient.accessToken.userId, 60)
                .catchError((error) {
              _displayDataAlert('startCommercial', error.toString());
            }),
            child: Text('Start Commercial'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient
                .getExtensionAnalytics(first: 1)
                .catchError((error) {
              _displayDataAlert('getExtensionAnalytics', error.toString());
            }),
            child: Text('Get Extension Analytics'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient
                .getGameAnalytics(gameId: '493057')
                .catchError((error) {
              _displayDataAlert('getGameAnalytics', error.toString());
            }),
            child: Text('Get Games Analytics'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient
                .getUsersFollows(toId: '23161357')
                .then((value) => _displayDataAlert(
                'getUsersFollows', 'Total followers: ${value.total}')),
            child: Text('Get User Follows from id 23161357'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient.getUsers(ids: ['44322889']).then(
                    (value) => _displayDataAlert(value.data.first.displayName,
                    value.data.first.description)),
            child: Text('Get User Dallas from id'),
          ),
          ElevatedButton(
            onPressed: () =>
                _twitchClient.getTopGames().then((value) => _displayDataAlert(
                  'Top Games',
                  value.data.map<String>((e) => e.name).toList().join('\n'),
                )),
            child: Text('Get Top Games'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient.getGames(names: ['Fortnite']).then(
                    (value) => _displayDataAlert(
                    value.data.first.name, value.data.first.getBoxArtUrl(),
                    isImg: true)),
            child: Text('Get Fortnite'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient
                .getChannelInformations('44445592')
                .then((value) => _displayDataAlert(
                value.data.first.broadcasterName, value.data.first.title)),
            child: Text('Get Pokimane Channel Info'),
          ),
          ElevatedButton(
            onPressed: () =>
                _twitchClient.getStreams(userLogins: ['auronplay']).then(
                      (value) => _displayDataAlert(value.data.first.userLogin,
                      'Viewers: ${value.data.first.viewerCount}',
                      isOnline: value.data.first.type == TwitchStreamType.live),
                ),
            child: Text('Get auronplay Stream Info'),
          ),
          ElevatedButton(
            onPressed: () =>
                _twitchClient.searchChannels(query: 'loserfruit').then(
                      (value) {
                    print(value.data.map((e) => e.broadcasterLogin).toList());
                    _displayDataAlert(
                        value.data.first.displayName, value.data.first.thumbnailUrl,
                        isImg: true, isOnline: value.data.first.isLive);
                  },
                ),
            child: Text('Search loserfruit Channel'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient.searchCategories(query: 'fort').then(
                  (value) => _displayDataAlert(
                  value.data.first.name, value.data.first.boxArtUrl,
                  isImg: true),
            ),
            child: Text('Search "fort" Category'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient.getBroadcasterSubscriptions().then(
                  (value) => _displayDataAlert(
                  value.data.first.userName, value.data.first.tier),
            ),
            child: Text('Get Broadcaster Subscriptions'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient.getBitsLeaderboard().then(
                  (value) => _displayDataAlert(value.data.first.userName,
                  value.data.first.score.toString()),
            ),
            child: Text('Get Bits Leaderboard'),
          ),
          ElevatedButton(
            onPressed: () => _twitchClient.getCheermotes().then(
                  (value) => _displayDataAlert(
                value.data.first.prefix,
                value.data.first.tiers.map((e) => e.id).toList().toString(),
              ),
            ),
            child: Text('Get Cheermotes'),
          ),
        ],
      ),*/
  }
}*/