import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';


class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future _future;

  Future<String> loadString() async =>
  await rootBundle.loadString('assets/text/about.md');
  @override
  void initState() {
    _future = loadString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About", style:  headlineFont()), centerTitle: true,
          leading: GestureDetector(
              onTap: ()=> Navigator.pop(context),
              child: Container(child: Image.asset('assets/images/back.png'),)),
          backgroundColor: obsidian(),
        ),
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot){

              return snapshot.hasData ? Markdown(data: snapshot.data, styleSheet:
              MarkdownStyleSheet(p: bodyFont(), listBullet: bodyFont()),) :
              Center(child: CircularProgressIndicator(),);
            })
      // SingleChildScrollView(child: Text(snapshot.hasData ? '${snapshot.data}' : ' Reading...', style: bodyFont(),))),
    );
  }
}