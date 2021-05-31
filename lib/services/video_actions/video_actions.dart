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

void changeFavourites(bool isFavourite, Video video, ConcreteUser user){
  if(isFavourite == true)
    try{
      addToFavourites(video, user);
      user.favourites.add(video.id);
    }catch(e){print(e);}
  if(isFavourite == false)
    try{
      removeFavourites(video, user);
      user.favourites.remove(video.id);
    }catch(e){print(e);}
}
Future<void> addToFavourites(Video video, ConcreteUser user) async{

  return  FirebaseFirestore.instance.collection('users')
      .doc(user.id)
      .collection("user_collections")
      .doc("favourites")
      .collection("favourite_videos")
      .doc(video.id)
      .set({
    'videoID': video.id,
    'source': video.source,
    'title': video.title,
    'author': video.channelTitle,
    'thumbnail': video.thumbnailUrl,
    'time': Timestamp.now(),
  })
      .then((value) => print("Favourite added"))
      .catchError((error) => print("Failed to add Favourite: $error"));
}

Future<void> removeFavourites(Video video, ConcreteUser user) async{
  user.favourites.remove(video.id);
  return  FirebaseFirestore.instance.collection('users')
      .doc(user.id)
      .collection("user_collections")
      .doc("favourites")
      .collection("favourite_videos")
      .doc(video.id).delete()
      .then((value) => print("Favourite removed"))
      .catchError((error) => print("Failed to remove Favourite: $error"));
}

