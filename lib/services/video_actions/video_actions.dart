import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vide_on/models/video.dart';
import 'package:vide_on/services/user/user.dart';

Future<void> addToWatched(Video video, ConcreteUser user) async{

  return  FirebaseFirestore.instance.collection('users')
      .doc(user.id)
      .collection("user_collections")
      .doc("watched")
      .collection("watched_videos")
      .doc(video.id)
      .set({
    'videoID': video.id,
    'source': video.source,
    'title': video.title,
    'author': video.channelTitle,
    'thumbnail': video.thumbnailUrl,
    'time': Timestamp.now(),
  })
      .then((value) => print("Watched added"))
      .catchError((error) => print("Failed to add Watched: $error"));
}