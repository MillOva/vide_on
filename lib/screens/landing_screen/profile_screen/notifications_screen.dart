import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';

class NotificationScreen extends StatefulWidget {
  final String userId;
  NotificationScreen({@required this.userId});
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _update = false;
  bool _subscriptions = false;
  bool _recommendations = false;

  @override
  void initState() {
    getNotifications(widget.userId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications", style: headlineFont()),
          centerTitle: true,
          leading: GestureDetector(
              onTap: ()  {Navigator.pop(context); updateNotifications(widget.userId);},
              child: Container(
                child: Image.asset('assets/images/back.png'),
              )),
          backgroundColor: obsidian(),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40, left: 32, right: 32),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                decoration: BoxDecoration(
                    color: charcoalGrey(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Application Update", style: bodyFont(),),
                    CupertinoSwitch(value: _update,
                      onChanged: (bool value) { setState(() { _update = value; }); },
                      activeColor: sapphire(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                decoration: BoxDecoration(
                    color: charcoalGrey(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subscriptions", style: bodyFont(),),
                    CupertinoSwitch(value: _subscriptions,
                      onChanged: (bool value) { setState(() { _subscriptions = value; }); },
                      activeColor: sapphire(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                decoration: BoxDecoration(
                    color: charcoalGrey(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommendations", style: bodyFont(),),
                    CupertinoSwitch(value: _recommendations,
                      onChanged: (bool value) { setState(() { _recommendations = value; }); },
                      activeColor: sapphire(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  Future<void> getNotifications(String userId) async {
    DocumentReference doc =
    FirebaseFirestore.instance.collection('users').doc(userId);
    try{
      return doc.get().then((value){
        setState(() {
          _update = value.data()['update'];
          _recommendations = value.data()['subscriptions'];
          _subscriptions = value.data()['recommendations'];
        });
      });
    }catch(e){
      print(e);
    }
  }
  Future<void> updateNotifications(String userId) async {
    DocumentReference doc =
    FirebaseFirestore.instance.collection('users').doc(userId);
    return doc.update({
      'update' : _update,
      'subscriptions' : _subscriptions,
      'recommendations' : _recommendations,
    });
  }
}
