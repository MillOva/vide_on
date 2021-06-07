import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/global/custom_widgets/alert.dart';
import 'package:vide_on/global/custom_widgets/input_field.dart';

class PasswordScreen extends StatefulWidget {
  final String userId;

  PasswordScreen({@required this.userId});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String _oldPassword;
  TextEditingController _oldPass = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _repNewPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getUserPassword(widget.userId);
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
          padding: EdgeInsets.only(top: 40, left: 32, right: 32),
          child: Column(
            children: [
              CustomInput(
                hint: "Old password",
                controller: _oldPass,
                height: 44,
                width: 318,
                obscure: true,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              CustomInput(
                hint: "New password",
                controller: _newPass,
                height: 44,
                width: 318,
                obscure: true,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              CustomInput(
                hint: "Repeat new password",
                controller: _repNewPass,
                height: 44,
                width: 318,
                obscure: true,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () => startProcessingPasswords(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  height: 48,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.5),
                      color: sapphire()),
                  child: Text(
                    "Save",
                    style: buttonFont(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void startProcessingPasswords() {
    //if(_oldPass != user.passwrod)
    if (_oldPass.text == "" || _newPass.text == "" || _repNewPass.text == "")
      showError("There are some empty fields!", context);
    else if (_oldPass.text == _newPass.text)
      showError("New password is same as old one!", context);
    else if (_repNewPass.text != _newPass.text)
      showError("New passwords doesn't match!", context);
    else if (_oldPassword != _oldPass.text)
      showError("Wrong old password!", context);
    else
      setNewPassword(widget.userId);
  }

  Future<void> getUserPassword(String userId) async {
    DocumentReference doc =
        FirebaseFirestore.instance.collection('users').doc(userId);
    return doc.get().then((value) => _oldPassword = value.data()['password']);
  }

  Future<void> setNewPassword(String userId) async {
    DocumentReference doc =
    FirebaseFirestore.instance.collection('users').doc(userId);
    try {
      return FirebaseAuth.instance.currentUser.updatePassword(_newPass.text)
          .whenComplete(() => doc.update({'password': _newPass.text})
          .then((value){
        showError("Password successful changed!", context);
        setState(() {});
        _newPass.clear();
        _oldPass.clear();
        _repNewPass.clear();
      })
      .catchError((e) => showError("$e Try again!", context)),);
    } catch (e) {
      showError("$e Try again!", context);
    }
  }
}
