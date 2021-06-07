import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/custom_widgets/alert.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen/watch_now_screen.dart';
import 'package:vide_on/services/user/user.dart';

class RegisterWithEmail{
  Future<void> register(String name, String email, String password, bool isAgree, BuildContext context) async{
    if(name.length == 0)
      showError("The user name is empty", context);
    else
    if(isAgree == false) {
      showError("The privacy policy is not confirmed.", context);
    }else
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential.user!=null){
        print("${userCredential.user.uid} + name = $name");
        createUserInDB(userCredential.user.uid, name, email, password, context);
        return FirebaseAuth.instance.authStateChanges()
            .map((User user) => user !=null ? ConcreteUser.fromFirebase(user) :null);
      }

    } on FirebaseAuthException catch (e) {
      print(e.code);
      if(e.code == 'unknown'){
        print('Make sure all field completed.');
        showError("Make sure all field completed.", context);
      }
      if(e.code == 'invalid-email'){
        print('The email provided is not valid.');
        showError("The email provided is not valid.", context);
      }
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showError("The password provided is too weak.", context);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showError("The account already exists for that email.", context);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUserInDB(String id, String name, String email, String password, BuildContext context) async{
    CollectionReference _users = FirebaseFirestore.instance.collection('users');
    return _users
        .doc(id)
        .set({
          'name' : name,
          'email' : email,
          'password' : password,
          'profilePicture' : "null",
          'update' : false,
          'subscriptions' : false,
          'recommendations' : false,
        })
        .then((value) {

      print("user added");
      return Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchNowScreen()));
    })
        .catchError((error) => print("Failed to add user: $error"));
  }

}