import 'package:firebase_auth/firebase_auth.dart';

class LoginGoogle{
  /* Future<void> login(String email, String password, BuildContext context) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential.user != null){
        print(userCredential.user.uid);
        notifyAboutUser();
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
  Stream<ConcreteUser> notifyAboutUser(){
    return FirebaseAuth.instance.authStateChanges()
        .map((User user) => user !=null ? ConcreteUser.fromFirebase(user) :null);
  }*/
}