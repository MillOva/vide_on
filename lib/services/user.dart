import 'package:firebase_auth/firebase_auth.dart';

class ConcreteUser{
  String _email;
  ConcreteUser.fromFirebase(User user){
    _email = user.email;
  }
  get email => _email;
  //get phone => _phone;
}
/*
Future<void> changeUserDa
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
Stream<ConcreteUser> get currentUser{
  return _firebaseAuth.authStateChanges()
      .map((User user) => user !=null ? ConcreteUser.fromFirebase(user) :null);
}*/