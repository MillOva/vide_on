import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/global/app_style/fonts.dart';
import 'package:vide_on/services/user/user.dart';

class ProfileSettingsContainer extends StatefulWidget {
  final double coefH;

  ProfileSettingsContainer({@required this.coefH});

  @override
  _ProfileSettingsContainerState createState() =>
      _ProfileSettingsContainerState();
}

class _ProfileSettingsContainerState extends State<ProfileSettingsContainer> {
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  PickedFile _localPhoto;

  Future<void> setPhoto(String id) async{
    try{
      await FirebaseStorage.instance
          .ref('$id/profile_pic')
          .putFile(File(_localPhoto.path));

      String downloadUrl = await FirebaseStorage.instance
          .ref('$id/profile_pic')
          .getDownloadURL();

      if(downloadUrl != null){
        FirebaseFirestore.instance.collection("users").doc(id).update({'profilePicture' : downloadUrl});
      }

    }catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    return _localPhoto == null
        ? FutureBuilder<DocumentSnapshot>(
            future: _users.doc(_user.id).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Container(
                      height: 92 * widget.coefH,
                      width: 92 * widget.coefH,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(46 * widget.coefH),
                          color: graphite()),
                      child: Icon(Icons.person, size: 70),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 24 * widget.coefH, bottom: 48),
                      child: Text(
                        "Hello ${_user.name}!",
                        style: headlineFont(),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    snapshot.data.data()['profilePicture'] == "null"
                        ? GestureDetector(
                            onTap: () async {
                              try {
                                final pickedFile = await ImagePicker().getImage(
                                  source: ImageSource.gallery,
                                  maxWidth: 640,
                                  maxHeight: 640,
                                );
                                setState(() {
                                  _localPhoto = pickedFile;
                                  print(_localPhoto.path);
                                  setPhoto(_user.id);
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 92 * widget.coefH,
                                  width: 92 * widget.coefH,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          46 * widget.coefH),
                                      color: graphite()),
                                ),
                                Container(
                                  height: 50 * widget.coefH,
                                  width: 2,
                                  color: sapphire(),
                                ),
                                Container(
                                  width: 50 * widget.coefH,
                                  height: 2,
                                  color: sapphire(),
                                ),
                              ],
                            ))
                        : GestureDetector(
                            onTap: () async {
                              try {
                                final pickedFile = await ImagePicker().getImage(
                                  source: ImageSource.gallery,
                                  maxWidth: 640,
                                  maxHeight: 640,
                                );
                                setState(() {
                                  _localPhoto = pickedFile;
                                  print(_localPhoto.path);
                                  setPhoto(_user.id);
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 92 * widget.coefH,
                                  width: 92 * widget.coefH,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          46 * widget.coefH),
                                      color: graphite(),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot.data
                                              .data()['profilePicture']),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 24 * widget.coefH,
                                  width: 92 * widget.coefH,
                                  color: likeColor(),
                                  child: Text(
                                    "Edit",
                                    style: bodyFont(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 24 * widget.coefH, bottom: 48),
                      child: Text(
                        "Hello ${_user.name}!",
                        style: headlineFont(),
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  Container(
                    height: 92 * widget.coefH,
                    width: 92 * widget.coefH,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(46 * widget.coefH),
                        color: graphite()),
                    child: Icon(Icons.person, size: 70),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 24 * widget.coefH, bottom: 48),
                    child: Text(
                      "Hello ${_user.name}!",
                      style: headlineFont(),
                    ),
                  ),
                ],
              );
            },
          )
        : Column(
            children: [
              GestureDetector(
                onTap: () async {
                  try {
                    final pickedFile = await ImagePicker().getImage(
                      source: ImageSource.gallery,
                      maxWidth: 640,
                      maxHeight: 640,
                    );
                    setState(() {
                      _localPhoto = pickedFile;
                      print(_localPhoto.path);
                      setPhoto(_user.id);
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 92 * widget.coefH,
                      width: 92 * widget.coefH,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(46 * widget.coefH),
                          color: graphite(),
                          image: DecorationImage(
                              image: FileImage(File(_localPhoto.path)),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 24 * widget.coefH,
                      width: 92 * widget.coefH,
                      color: likeColor(),
                      child: Text(
                        "Edit",
                        style: bodyFont(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24 * widget.coefH, bottom: 48),
                child: Text(
                  "Hello ${_user.name}!",
                  style: headlineFont(),
                ),
              ),
            ],
          );
  }
}
