import 'package:firebase_auth/firebase_auth.dart';

class ConcreteUser{
  String _email;
  String _id;
  ConcreteUser.fromFirebase(User user){
    _email = user.email;
    _id = user.uid;
  }
  get email => _email;
  get id => _id;
}
