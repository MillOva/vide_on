
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vide_on/services/video_actions/parse_tw_video.dart';
import 'package:vide_on/services/video_actions/parse_vm_video.dart';
import 'package:vide_on/services/video_actions/parse_yt_video.dart';

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
        source: snippet['source']
    );
  }

  factory Video.fromYT(Item video) {
    return Video(
        id: video.id,
        title: video.snippet.title,
        thumbnailUrl: video.snippet.thumbnails.high.url,
        channelTitle: video.snippet.channelTitle,
        source: "YouTube",
    );
  }
  factory Video.fromTW(Stream stream) {
    return Video(
      id: stream.id.toString(),
      title: stream.channel.status,
      thumbnailUrl: stream.preview.large,
      channelTitle: stream.channel.name,
      source: "Twitch",
    );
  }

  factory Video.fromVM(Datum datum) {
    return Video(
      id: datum.uri,
      title: datum.name,
      thumbnailUrl: datum.pictures.sizes[3].link,
      channelTitle: datum.user.name,
      source: "Vimeo",
    );
  }
}