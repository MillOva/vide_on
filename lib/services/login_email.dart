import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/custom_widgets/alert.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen.dart';
import 'package:vide_on/services/user.dart';

class LoginWithEmail{
  Future<void> login(String email, String password, BuildContext context) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential.user != null){
        print(userCredential.user.uid);
        /*return FirebaseAuth.instance.authStateChanges()
            .map((User user) => user !=null ? ConcreteUser.fromFirebase(user) :null);*/
        return Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchNowScreen()));
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showError("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showError("Wrong password provided for that user.", context);
      }
    }
  }
}