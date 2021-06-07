import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/global/custom_widgets/input_field.dart';

class SupportScreen extends StatefulWidget {
  final String userId;
  final String userName;

  SupportScreen({@required this.userId, @required this.userName});

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController _chatController = TextEditingController();

  @override
  void initState() {
    startChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Support", style: headlineFont()),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              child: Image.asset('assets/images/back.png'),
            )),
        backgroundColor: obsidian(),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(widget.userId)
                    .collection('messages')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("loading...");
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    data = snapshot.data;
                    return ListView.builder(
                      reverse: true,
                      itemCount: data.docs.length,
                      //shrinkWrap: true,
                      itemBuilder: (context, index) {
                        print("messages - ${data.docs.length}");
                        print("message: ${data.docs[index]['message']}");
                        if (data.docs[index]['author'] == widget.userId)
                          return sendedMessage(data.docs[index]['message']);
                        else
                          return recivedMessage(data.docs[index]['message']);
                      },
                    );
                  }
                  return Text("loading...");
                }),
          ),
          Container(
            padding: EdgeInsets.only(top: 6, left: 8, right: 8),
            height: 78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.paperclip,
                    color: sapphire(),
                  ),
                  onPressed: null,
                ),
                CustomInput(
                  hint: "Text Message",
                  height: 33,
                  width: 280,
                  obscure: false,
                  textInputType: TextInputType.text,
                  controller: _chatController,
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.paperplane,
                    color: sapphire(),
                  ),
                  onPressed: ()=> _chatController.text.isNotEmpty ? sendMessage(_chatController.text) : null,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sendedMessage(String text) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 50, top: 5, bottom: 5),
        child: Container(
          //alignment: Alignment.topRight,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: calcite()),
          child: Text(
            "$text",
            style: bodyFont2(),
          ),
        ),
      ),
    );
  }

  Widget recivedMessage(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.only(right: 50, left: 10, top: 5, bottom: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: charcoalGrey()),
          child: Text("$text", style: bodyFont()),
        ),
      ),
    );
  }

  Future<void> startChat() async {
    CollectionReference _chats = FirebaseFirestore.instance.collection('chats');
    return _chats.doc(widget.userId).collection('messages').doc().set({
      'message':
          "Hello ${widget.userName}! Thank you for contacting us at VideOn Support. How can we help you?",
      'time': Timestamp.now(),
      'author': 'support'
    }).then((value) {
      print("chat created");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> sendMessage(String message) async {
    _chatController.clear();
    CollectionReference _chats = FirebaseFirestore.instance.collection('chats');
    return _chats.doc(widget.userId).collection('messages').doc().set({
      'message': message,
      'time': Timestamp.now(),
      'author': widget.userId
    }).then((value) {
      print("message sent");
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
