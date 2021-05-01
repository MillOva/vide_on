import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vide_on/global/custom_widgets/alert.dart';
import 'package:vide_on/screens/landing_screen/watch_now_screen.dart';
import 'package:vide_on/services/user.dart';

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
        /*return FirebaseAuth.instance.authStateChanges()
            .map((User user) => user !=null ? ConcreteUser.fromFirebase(user) :null);*/
        return Navigator.push(context, MaterialPageRoute(builder: (context)=> WatchNowScreen()));
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
}