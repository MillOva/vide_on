import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConcreteUser {
  String _email;
  String _id;
  String _name;
  List<String> _favourites = [];

  ConcreteUser.fromFirebase(User user) {

    _email = user.email;
    _id = user.uid;

    getFavouriteVideos(_id);
    getUserName(_id);
  }

  get name => _name;

  get email => _email;

  get id => _id;

  get favourites => _favourites;

  Future<void> getFavouriteVideos(String userId) async {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection("user_collections")
          .doc("favourites")
          .collection("favourite_videos")
          .get()
          .then((value) => value.docs.forEach((element) {
                _favourites.add(element.id);
              }))
          .whenComplete(() => _favourites);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserName(String userId) async {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId).get()
          .then((value) => _name = value.data()['name'])
          .whenComplete(() => _name);
    } catch (e) {
      print(e);
    }
  }

  Future<void> clearUser() async {
    return FirebaseAuth.instance.signOut();
  }

}
