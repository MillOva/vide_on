// To parse this JSON data, do
//
//     final twitchVideoFromSearch = twitchVideoFromSearchFromJson(jsonString);

import 'dart:convert';

TwitchVideoFromSearch twitchVideoFromSearchFromJson(String str) => TwitchVideoFromSearch.fromJson(json.decode(str));

String twitchVideoFromSearchToJson(TwitchVideoFromSearch data) => json.encode(data.toJson());

class TwitchVideoFromSearch {
  TwitchVideoFromSearch({
    this.total,
    this.streams,
  });

  int total;
  List<Stream> streams;

  factory TwitchVideoFromSearch.fromJson(Map<String, dynamic> json) => TwitchVideoFromSearch(
    total: json["_total"],
    streams: List<Stream>.from(json["streams"].map((x) => Stream.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_total": total,
    "streams": List<dynamic>.from(streams.map((x) => x.toJson())),
  };
}

class Stream {
  Stream({
    this.id,
    this.averageFps,
    this.channel,
    this.createdAt,
    this.delay,
    this.game,
    this.isPlaylist,
    this.preview,
    this.videoHeight,
    this.viewers,
  });

  int id;
  double averageFps;
  Channel channel;
  DateTime createdAt;
  int delay;
  String game;
  bool isPlaylist;
  Preview preview;
  int videoHeight;
  int viewers;

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
    id: json["_id"],
    averageFps: json["average_fps"].toDouble(),
    channel: Channel.fromJson(json["channel"]),
    createdAt: DateTime.parse(json["created_at"]),
    delay: json["delay"],
    game: json["game"],
    isPlaylist: json["is_playlist"],
    preview: Preview.fromJson(json["preview"]),
    videoHeight: json["video_height"],
    viewers: json["viewers"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "average_fps": averageFps,
    "channel": channel.toJson(),
    "created_at": createdAt.toIso8601String(),
    "delay": delay,
    "game": game,
    "is_playlist": isPlaylist,
    "preview": preview.toJson(),
    "video_height": videoHeight,
    "viewers": viewers,
  };
}

class Channel {
  Channel({
    this.id,
    this.broadcasterLanguage,
    this.createdAt,
    this.displayName,
    this.followers,
    this.game,
    this.language,
    this.logo,
    this.mature,
    this.name,
    this.partner,
    this.profileBanner,
    this.profileBannerBackgroundColor,
    this.status,
    this.updatedAt,
    this.url,
    this.videoBanner,
    this.views,
  });

  int id;
  String broadcasterLanguage;
  DateTime createdAt;
  String displayName;
  int followers;
  String game;
  String language;
  String logo;
  bool mature;
  String name;
  bool partner;
  String profileBanner;
  String profileBannerBackgroundColor;
  String status;
  DateTime updatedAt;
  String url;
  String videoBanner;
  int views;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json["_id"],
    broadcasterLanguage: json["broadcaster_language"],
    createdAt: DateTime.parse(json["created_at"]),
    displayName: json["display_name"],
    followers: json["followers"],
    game: json["game"],
    language: json["language"],
    logo: json["logo"],
    mature: json["mature"],
    name: json["name"],
    partner: json["partner"],
    profileBanner: json["profile_banner"],
    profileBannerBackgroundColor: json["profile_banner_background_color"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
    videoBanner: json["video_banner"],
    views: json["views"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "broadcaster_language": broadcasterLanguage,
    "created_at": createdAt.toIso8601String(),
    "display_name": displayName,
    "followers": followers,
    "game": game,
    "language": language,
    "logo": logo,
    "mature": mature,
    "name": name,
    "partner": partner,
    "profile_banner": profileBanner,
    "profile_banner_background_color": profileBannerBackgroundColor,
    "status": status,
    "updated_at": updatedAt.toIso8601String(),
    "url": url,
    "video_banner": videoBanner,
    "views": views,
  };
}

class Preview {
  Preview({
    this.large,
    this.medium,
    this.small,
    this.template,
  });

  String large;
  String medium;
  String small;
  String template;

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
    large: json["large"],
    medium: json["medium"],
    small: json["small"],
    template: json["template"],
  );

  Map<String, dynamic> toJson() => {
    "large": large,
    "medium": medium,
    "small": small,
    "template": template,
  };
}
