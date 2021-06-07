import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vide_on/global/app_style/colors.dart';
import 'package:vide_on/services/user/user.dart';

class ProfilePictureContainer extends StatefulWidget {
  @override
  _ProfilePictureContainerState createState() => _ProfilePictureContainerState();
}

class _ProfilePictureContainerState extends State<ProfilePictureContainer> {
  CollectionReference _users = FirebaseFirestore.instance.collection('users');


  @override
  Widget build(BuildContext context) {
    final ConcreteUser _user = Provider.of<ConcreteUser>(context);
    return FutureBuilder<DocumentSnapshot>(
      future: _users.doc(_user.id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Container(height: 50, width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: graphite(),),
              child: Icon(Icons.person,size: 40));
        }


        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return data['profilePicture']=="null"
              ? Container(height: 50, width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: graphite(),),
                child: Icon(Icons.person,size: 40),
          )
          :Container(height: 50, width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: graphite(),
            image: DecorationImage(image: NetworkImage(data['profilePicture']),fit: BoxFit.cover)),
          );
        }

        return Container(height: 50, width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: graphite(),),
            child: Icon(Icons.person,size: 40));
      },
    );
  }
}
