import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'file:///C:/flutter_projects/flutterlearning/vide_on/lib/global/app_style/fonts.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  Future _future;

  Future<String> loadString() async =>
      //await rootBundle.loadString('assets/text/PrivacyPolicy.rtf');
      await rootBundle.loadString('assets/text/privacy_policy.md');
  @override
  void initState() {
    _future = loadString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy", style:  headlineFont()), centerTitle: true,
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