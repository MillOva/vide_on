import 'package:vide_on/models/video.dart';

class Channel{
  final String id;
  final String title;
  final String profilePicUrl;
  final String subscriberCount;
  final String videoCount;
  final String uploadPlaylistId;
  List<Video> videos;

  Channel(
      {this.id,
      this.title,
      this.profilePicUrl,
      this.subscriberCount,
      this.uploadPlaylistId,
      this.videoCount,
      this.videos});

  factory Channel.fromMap(Map<String, dynamic> map){
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilePicUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads'],
    );
  }
}

