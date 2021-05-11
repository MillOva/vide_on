
import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;
  final String source;

  Video({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.channelTitle,
    this.source
  });

  factory Video.fromMap(QueryDocumentSnapshot snippet) {
    return Video(
      id: snippet['videoID'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnail'],
      channelTitle: snippet['author'],
      source:  snippet['source']
    );
  }

}