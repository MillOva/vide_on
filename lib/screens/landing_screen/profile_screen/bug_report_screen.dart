import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/global/custom_widgets/alert.dart';

class BugReportScreen extends StatefulWidget {
  final String userId;

  BugReportScreen({@required this.userId});

  @override
  _BugReportScreenState createState() => _BugReportScreenState();
}

class _BugReportScreenState extends State<BugReportScreen> {
  TextEditingController _bugText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Password", style: headlineFont()),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                child: Image.asset('assets/images/back.png'),
              )),
          backgroundColor: obsidian(),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 32, left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: 318,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: charcoalGrey()),
                child: TextField(
                  maxLines: 20,
                  controller: _bugText,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  style: bodyFont(),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    isCollapsed: true,
                    hintStyle: bodyFont(),
                    hintText: "Describe your problem here!",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: calcite(), width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    CupertinoIcons.paperclip,
                    color: sapphire(),
                  ),
                  label: Text(
                    "Add photos",
                    style: bodyFont4(),
                  )),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () => sendReport(),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    height: 48,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.5),
                        color: sapphire()),
                    child: Text(
                      "Send",
                      style: buttonFont(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> sendReport() async {
    try {
      return FirebaseFirestore.instance.collection('reports').doc().set({
        'userId': widget.userId,
        'time': Timestamp.now(),
        'bugText': _bugText.text,
      }).then((value) {
        showError("Report sent successful!", context);
        _bugText.clear();
      }).catchError((e) => showError("$e Try again!", context));
    } catch (e) {
      print(e);
    }
  }
}
