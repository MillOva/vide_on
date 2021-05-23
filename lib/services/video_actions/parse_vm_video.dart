
import 'dart:convert';
// To parse this JSON data, do
//
//     final vimeoVideo = vimeoVideoFromJson(jsonString);


VimeoVideo vimeoVideoFromJson(String str) => VimeoVideo.fromJson(json.decode(str));

String vimeoVideoToJson(VimeoVideo data) => json.encode(data.toJson());

class VimeoVideo {
  VimeoVideo({
    //this.total,
    //this.page,
    //this.perPage,
    //this.paging,
    this.data,
  });

  //int total;
  //int page;
  //int perPage;
  //Paging paging;
  List<Datum> data;

  factory VimeoVideo.fromJson(Map<String, dynamic> json) => VimeoVideo(
    //total: json["total"],
    //page: json["page"],
    //perPage: json["per_page"],
    //paging: Paging.fromJson(json["paging"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    //"total": total,
    //"page": page,
    //"per_page": perPage,
    //"paging": paging.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.uri,
    this.name,
    this.description,
    this.link,
    this.duration,
    this.width,
    this.height,
    this.embed,
    this.pictures,
    this.user,
  });

  String uri;
  String name;
  String description;
  String link;
  int duration;
  int width;
  int height;
  Embed embed;
  Pictures pictures;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uri: json["uri"],
    name: json["name"],
    description: json["description"],
    link: json["link"],
    duration: json["duration"],
    width: json["width"],
    height: json["height"],
    embed: Embed.fromJson(json["embed"]),
    pictures: Pictures.fromJson(json["pictures"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "description": description,
    "link": link,
    "duration": duration,
    "width": width,
    "height": height,
    "embed": embed.toJson(),
    "pictures": pictures.toJson(),
    "user": user.toJson(),
  };
}

class Category {
  Category({
    this.uri,
    this.name,
    this.link,
    this.topLevel,
    this.isDeprecated,
    this.pictures,
    this.lastVideoFeaturedTime,
    this.parent,
    this.metadata,
    this.subcategories,
    this.icon,
    this.resourceKey,
  });

  String uri;
  String name;
  String link;
  bool topLevel;
  bool isDeprecated;
  Pictures pictures;
  DateTime lastVideoFeaturedTime;
  Parent parent;
  CategoryMetadata metadata;
  List<Parent> subcategories;
  Pictures icon;
  String resourceKey;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    uri: json["uri"],
    name: json["name"],
    link: json["link"],
    topLevel: json["top_level"],
    isDeprecated: json["is_deprecated"],
    pictures: Pictures.fromJson(json["pictures"]),
    lastVideoFeaturedTime: DateTime.parse(json["last_video_featured_time"]),
    parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
    metadata: CategoryMetadata.fromJson(json["metadata"]),
    subcategories: json["subcategories"] == null ? null : List<Parent>.from(json["subcategories"].map((x) => Parent.fromJson(x))),
    icon: json["icon"] == null ? null : Pictures.fromJson(json["icon"]),
    resourceKey: json["resource_key"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "link": link,
    "top_level": topLevel,
    "is_deprecated": isDeprecated,
    "pictures": pictures.toJson(),
    "last_video_featured_time": lastVideoFeaturedTime.toIso8601String(),
    "parent": parent == null ? null : parent.toJson(),
    "metadata": metadata.toJson(),
    "subcategories": subcategories == null ? null : List<dynamic>.from(subcategories.map((x) => x.toJson())),
    "icon": icon == null ? null : icon.toJson(),
    "resource_key": resourceKey,
  };
}

class Pictures {
  Pictures({
    this.uri,
    this.active,
    this.type,
    this.sizes,
    this.resourceKey,
    this.defaultPicture,
  });

  String uri;
  bool active;
  Type type;
  List<Size> sizes;
  String resourceKey;
  bool defaultPicture;

  factory Pictures.fromJson(Map<String, dynamic> json) => Pictures(
    uri: json["uri"],
    active: json["active"],
    type: typeValues.map[json["type"]],
    sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
    resourceKey: json["resource_key"],
    defaultPicture: json["default_picture"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "active": active,
    "type": typeValues.reverse[type],
    "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
    "resource_key": resourceKey,
    "default_picture": defaultPicture,
  };
}

class Size {
  Size({
    this.width,
    this.height,
    this.link,
    this.linkWithPlayButton,
  });

  int width;
  int height;
  String link;
  String linkWithPlayButton;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    width: json["width"],
    height: json["height"],
    link: json["link"],
    linkWithPlayButton: json["link_with_play_button"] == null ? null : json["link_with_play_button"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "link": link,
    "link_with_play_button": linkWithPlayButton == null ? null : linkWithPlayButton,
  };
}

enum Type { CUSTOM }

final typeValues = EnumValues({
  "custom": Type.CUSTOM
});

class CategoryMetadata {
  CategoryMetadata({
    this.connections,
    this.interactions,
  });

  PurpleConnections connections;
  PurpleInteractions interactions;

  factory CategoryMetadata.fromJson(Map<String, dynamic> json) => CategoryMetadata(
    connections: PurpleConnections.fromJson(json["connections"]),
    interactions: PurpleInteractions.fromJson(json["interactions"]),
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
    "interactions": interactions.toJson(),
  };
}

class PurpleConnections {
  PurpleConnections({
    this.channels,
    this.groups,
    this.users,
    this.videos,
  });

  Albums channels;
  Albums groups;
  Albums users;
  Albums videos;

  factory PurpleConnections.fromJson(Map<String, dynamic> json) => PurpleConnections(
    channels: Albums.fromJson(json["channels"]),
    groups: Albums.fromJson(json["groups"]),
    users: Albums.fromJson(json["users"]),
    videos: Albums.fromJson(json["videos"]),
  );

  Map<String, dynamic> toJson() => {
    "channels": channels.toJson(),
    "groups": groups.toJson(),
    "users": users.toJson(),
    "videos": videos.toJson(),
  };
}

class Albums {
  Albums({
    this.uri,
    this.options,
    this.total,
  });

  String uri;
  List<AlbumsOption> options;
  int total;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
    uri: json["uri"],
    options: List<AlbumsOption>.from(json["options"].map((x) => albumsOptionValues.map[x])),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "options": List<dynamic>.from(options.map((x) => albumsOptionValues.reverse[x])),
    "total": total,
  };
}

enum AlbumsOption { GET, PATCH, POST }

final albumsOptionValues = EnumValues({
  "GET": AlbumsOption.GET,
  "PATCH": AlbumsOption.PATCH,
  "POST": AlbumsOption.POST
});

class PurpleInteractions {
  PurpleInteractions({
    this.follow,
  });

  Like follow;

  factory PurpleInteractions.fromJson(Map<String, dynamic> json) => PurpleInteractions(
    follow: Like.fromJson(json["follow"]),
  );

  Map<String, dynamic> toJson() => {
    "follow": follow.toJson(),
  };
}

class Like {
  Like({
    this.added,
    this.addedTime,
    this.uri,
    this.options,
  });

  bool added;
  dynamic addedTime;
  String uri;
  List<LikeOption> options;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    added: json["added"],
    addedTime: json["added_time"],
    uri: json["uri"],
    options: json["options"] == null ? null : List<LikeOption>.from(json["options"].map((x) => likeOptionValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "added": added,
    "added_time": addedTime,
    "uri": uri,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => likeOptionValues.reverse[x])),
  };
}

enum LikeOption { GET, PUT, DELETE }

final likeOptionValues = EnumValues({
  "DELETE": LikeOption.DELETE,
  "GET": LikeOption.GET,
  "PUT": LikeOption.PUT
});

class Parent {
  Parent({
    this.uri,
    this.name,
    this.link,
  });

  String uri;
  String name;
  String link;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    uri: json["uri"],
    name: json["name"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "link": link,
  };
}

class Embed {
  Embed({
    this.html,
    this.badges,
  });

  String html;
  Badges badges;

  factory Embed.fromJson(Map<String, dynamic> json) => Embed(
    html: json["html"],
    badges: Badges.fromJson(json["badges"]),
  );

  Map<String, dynamic> toJson() => {
    "html": html,
    "badges": badges.toJson(),
  };
}

class Badges {
  Badges({
    this.hdr,
    this.live,
    this.staffPick,
    this.vod,
    this.weekendChallenge,
  });

  bool hdr;
  Live live;
  StaffPick staffPick;
  bool vod;
  bool weekendChallenge;

  factory Badges.fromJson(Map<String, dynamic> json) => Badges(
    hdr: json["hdr"],
    live: Live.fromJson(json["live"]),
    staffPick: StaffPick.fromJson(json["staff_pick"]),
    vod: json["vod"],
    weekendChallenge: json["weekend_challenge"],
  );

  Map<String, dynamic> toJson() => {
    "hdr": hdr,
    "live": live.toJson(),
    "staff_pick": staffPick.toJson(),
    "vod": vod,
    "weekend_challenge": weekendChallenge,
  };
}

class Live {
  Live({
    this.streaming,
    this.archived,
  });

  bool streaming;
  bool archived;

  factory Live.fromJson(Map<String, dynamic> json) => Live(
    streaming: json["streaming"],
    archived: json["archived"],
  );

  Map<String, dynamic> toJson() => {
    "streaming": streaming,
    "archived": archived,
  };
}

class StaffPick {
  StaffPick({
    this.normal,
    this.bestOfTheMonth,
    this.bestOfTheYear,
    this.premiere,
  });

  bool normal;
  bool bestOfTheMonth;
  bool bestOfTheYear;
  bool premiere;

  factory StaffPick.fromJson(Map<String, dynamic> json) => StaffPick(
    normal: json["normal"],
    bestOfTheMonth: json["best_of_the_month"],
    bestOfTheYear: json["best_of_the_year"],
    premiere: json["premiere"],
  );

  Map<String, dynamic> toJson() => {
    "normal": normal,
    "best_of_the_month": bestOfTheMonth,
    "best_of_the_year": bestOfTheYear,
    "premiere": premiere,
  };
}

class DatumMetadata {
  DatumMetadata({
    this.connections,
    this.interactions,
    this.isVimeoCreate,
    this.isScreenRecord,
  });

  FluffyConnections connections;
  FluffyInteractions interactions;
  bool isVimeoCreate;
  bool isScreenRecord;

  factory DatumMetadata.fromJson(Map<String, dynamic> json) => DatumMetadata(
    connections: FluffyConnections.fromJson(json["connections"]),
    interactions: FluffyInteractions.fromJson(json["interactions"]),
    isVimeoCreate: json["is_vimeo_create"],
    isScreenRecord: json["is_screen_record"],
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
    "interactions": interactions.toJson(),
    "is_vimeo_create": isVimeoCreate,
    "is_screen_record": isScreenRecord,
  };
}

class FluffyConnections {
  FluffyConnections({
    this.comments,
    this.credits,
    this.likes,
    this.pictures,
    this.texttracks,
    this.related,
    this.recommendations,
    this.albums,
    this.availableAlbums,
    this.availableChannels,
  });

  Albums comments;
  Albums credits;
  Albums likes;
  Albums pictures;
  Albums texttracks;
  Recommendations related;
  Recommendations recommendations;
  Albums albums;
  Albums availableAlbums;
  Albums availableChannels;

  factory FluffyConnections.fromJson(Map<String, dynamic> json) => FluffyConnections(
    comments: Albums.fromJson(json["comments"]),
    credits: Albums.fromJson(json["credits"]),
    likes: Albums.fromJson(json["likes"]),
    pictures: Albums.fromJson(json["pictures"]),
    texttracks: Albums.fromJson(json["texttracks"]),
    related: Recommendations.fromJson(json["related"]),
    recommendations: Recommendations.fromJson(json["recommendations"]),
    albums: Albums.fromJson(json["albums"]),
    availableAlbums: Albums.fromJson(json["available_albums"]),
    availableChannels: Albums.fromJson(json["available_channels"]),
  );

  Map<String, dynamic> toJson() => {
    "comments": comments.toJson(),
    "credits": credits.toJson(),
    "likes": likes.toJson(),
    "pictures": pictures.toJson(),
    "texttracks": texttracks.toJson(),
    "related": related.toJson(),
    "recommendations": recommendations.toJson(),
    "albums": albums.toJson(),
    "available_albums": availableAlbums.toJson(),
    "available_channels": availableChannels.toJson(),
  };
}

class Recommendations {
  Recommendations({
    this.uri,
    this.options,
  });

  String uri;
  List<AlbumsOption> options;

  factory Recommendations.fromJson(Map<String, dynamic> json) => Recommendations(
    uri: json["uri"],
    options: List<AlbumsOption>.from(json["options"].map((x) => albumsOptionValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "options": List<dynamic>.from(options.map((x) => albumsOptionValues.reverse[x])),
  };
}

class FluffyInteractions {
  FluffyInteractions({
    this.watchlater,
    this.like,
    this.report,
    this.updatePrivacyToPublic,
  });

  Like watchlater;
  Like like;
  Report report;
  bool updatePrivacyToPublic;

  factory FluffyInteractions.fromJson(Map<String, dynamic> json) => FluffyInteractions(
    watchlater: Like.fromJson(json["watchlater"]),
    like: Like.fromJson(json["like"]),
    report: Report.fromJson(json["report"]),
    updatePrivacyToPublic: json["update_privacy_to_public"],
  );

  Map<String, dynamic> toJson() => {
    "watchlater": watchlater.toJson(),
    "like": like.toJson(),
    "report": report.toJson(),
    "update_privacy_to_public": updatePrivacyToPublic,
  };
}

class Report {
  Report({
    this.uri,
    this.options,
    this.reason,
  });

  String uri;
  List<AlbumsOption> options;
  List<String> reason;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    uri: json["uri"],
    options: List<AlbumsOption>.from(json["options"].map((x) => albumsOptionValues.map[x])),
    reason: List<String>.from(json["reason"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "options": List<dynamic>.from(options.map((x) => albumsOptionValues.reverse[x])),
    "reason": List<dynamic>.from(reason.map((x) => x)),
  };
}

class Privacy {
  Privacy({
    this.view,
    this.embed,
    this.download,
    this.add,
    this.comments,
  });

  String view;
  String embed;
  bool download;
  bool add;
  String comments;

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
    view: json["view"],
    embed: json["embed"],
    download: json["download"],
    add: json["add"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "view": view,
    "embed": embed,
    "download": download,
    "add": add,
    "comments": comments,
  };
}

class Stats {
  Stats({
    this.plays,
  });

  int plays;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    plays: json["plays"],
  );

  Map<String, dynamic> toJson() => {
    "plays": plays,
  };
}

class Tag {
  Tag({
    this.uri,
    this.name,
    this.tag,
    this.canonical,
    this.metadata,
    this.resourceKey,
  });

  String uri;
  String name;
  String tag;
  String canonical;
  TagMetadata metadata;
  String resourceKey;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    uri: json["uri"],
    name: json["name"],
    tag: json["tag"],
    canonical: json["canonical"],
    metadata: TagMetadata.fromJson(json["metadata"]),
    resourceKey: json["resource_key"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "tag": tag,
    "canonical": canonical,
    "metadata": metadata.toJson(),
    "resource_key": resourceKey,
  };
}

class TagMetadata {
  TagMetadata({
    this.connections,
  });

  TentacledConnections connections;

  factory TagMetadata.fromJson(Map<String, dynamic> json) => TagMetadata(
    connections: TentacledConnections.fromJson(json["connections"]),
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
  };
}

class TentacledConnections {
  TentacledConnections({
    this.videos,
  });

  Albums videos;

  factory TentacledConnections.fromJson(Map<String, dynamic> json) => TentacledConnections(
    videos: Albums.fromJson(json["videos"]),
  );

  Map<String, dynamic> toJson() => {
    "videos": videos.toJson(),
  };
}

class Transcode {
  Transcode({
    this.status,
  });

  String status;

  factory Transcode.fromJson(Map<String, dynamic> json) => Transcode(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class Upload {
  Upload({
    this.status,
    this.link,
    this.uploadLink,
    this.completeUri,
    this.form,
    this.approach,
    this.size,
    this.redirectUrl,
  });

  String status;
  dynamic link;
  dynamic uploadLink;
  dynamic completeUri;
  dynamic form;
  dynamic approach;
  dynamic size;
  dynamic redirectUrl;

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
    status: json["status"],
    link: json["link"],
    uploadLink: json["upload_link"],
    completeUri: json["complete_uri"],
    form: json["form"],
    approach: json["approach"],
    size: json["size"],
    redirectUrl: json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "link": link,
    "upload_link": uploadLink,
    "complete_uri": completeUri,
    "form": form,
    "approach": approach,
    "size": size,
    "redirect_url": redirectUrl,
  };
}

class Uploader {
  Uploader({
    this.pictures,
  });

  Pictures pictures;

  factory Uploader.fromJson(Map<String, dynamic> json) => Uploader(
    pictures: Pictures.fromJson(json["pictures"]),
  );

  Map<String, dynamic> toJson() => {
    "pictures": pictures.toJson(),
  };
}

class User {
  User({
    this.uri,
    this.name,
    this.link,
    this.capabilities,
    this.location,
    this.gender,
    this.bio,
    this.shortBio,
    this.createdTime,
    this.pictures,
    this.websites,
    this.metadata,
    this.locationDetails,
    this.skills,
    this.availableForHire,
    this.canWorkRemotely,
    this.resourceKey,
    this.account,
  });

  String uri;
  String name;
  String link;
  Capabilities capabilities;
  String location;
  String gender;
  String bio;
  String shortBio;
  DateTime createdTime;
  Pictures pictures;
  List<Website> websites;
  UserMetadata metadata;
  LocationDetails locationDetails;
  List<Skill> skills;
  bool availableForHire;
  bool canWorkRemotely;
  String resourceKey;
  String account;

  factory User.fromJson(Map<String, dynamic> json) => User(
    uri: json["uri"],
    name: json["name"],
    link: json["link"],
    capabilities: Capabilities.fromJson(json["capabilities"]),
    location: json["location"],
    gender: json["gender"],
    bio: json["bio"],
    shortBio: json["short_bio"] == null ? null : json["short_bio"],
    createdTime: DateTime.parse(json["created_time"]),
    pictures: Pictures.fromJson(json["pictures"]),
    websites: List<Website>.from(json["websites"].map((x) => Website.fromJson(x))),
    metadata: UserMetadata.fromJson(json["metadata"]),
    locationDetails: LocationDetails.fromJson(json["location_details"]),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    availableForHire: json["available_for_hire"],
    canWorkRemotely: json["can_work_remotely"],
    resourceKey: json["resource_key"],
    account: json["account"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "link": link,
    "capabilities": capabilities.toJson(),
    "location": location,
    "gender": gender,
    "bio": bio,
    "short_bio": shortBio == null ? null : shortBio,
    "created_time": createdTime.toIso8601String(),
    "pictures": pictures.toJson(),
    "websites": List<dynamic>.from(websites.map((x) => x.toJson())),
    "metadata": metadata.toJson(),
    "location_details": locationDetails.toJson(),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "available_for_hire": availableForHire,
    "can_work_remotely": canWorkRemotely,
    "resource_key": resourceKey,
    "account": account,
  };
}

class Capabilities {
  Capabilities({
    this.hasLiveSubscription,
    this.hasEnterpriseLihp,
    this.hasSvvTimecodedComments,
  });

  bool hasLiveSubscription;
  bool hasEnterpriseLihp;
  bool hasSvvTimecodedComments;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
    hasLiveSubscription: json["hasLiveSubscription"],
    hasEnterpriseLihp: json["hasEnterpriseLihp"],
    hasSvvTimecodedComments: json["hasSvvTimecodedComments"],
  );

  Map<String, dynamic> toJson() => {
    "hasLiveSubscription": hasLiveSubscription,
    "hasEnterpriseLihp": hasEnterpriseLihp,
    "hasSvvTimecodedComments": hasSvvTimecodedComments,
  };
}

class LocationDetails {
  LocationDetails({
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.neighborhood,
    this.subLocality,
    this.stateIsoCode,
    this.country,
    this.countryIsoCode,
  });

  String formattedAddress;
  double latitude;
  double longitude;
  String city;
  String state;
  dynamic neighborhood;
  dynamic subLocality;
  String stateIsoCode;
  String country;
  String countryIsoCode;

  factory LocationDetails.fromJson(Map<String, dynamic> json) => LocationDetails(
    formattedAddress: json["formatted_address"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    neighborhood: json["neighborhood"],
    subLocality: json["sub_locality"],
    stateIsoCode: json["state_iso_code"] == null ? null : json["state_iso_code"],
    country: json["country"] == null ? null : json["country"],
    countryIsoCode: json["country_iso_code"] == null ? null : json["country_iso_code"],
  );

  Map<String, dynamic> toJson() => {
    "formatted_address": formattedAddress,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "neighborhood": neighborhood,
    "sub_locality": subLocality,
    "state_iso_code": stateIsoCode == null ? null : stateIsoCode,
    "country": country == null ? null : country,
    "country_iso_code": countryIsoCode == null ? null : countryIsoCode,
  };
}

class UserMetadata {
  UserMetadata({
    this.connections,
   // this.interactions,
  });

  StickyConnections connections;
 // TentacledInteractions interactions;

  factory UserMetadata.fromJson(Map<String, dynamic> json) => UserMetadata(
    connections: StickyConnections.fromJson(json["connections"]),
    //interactions: TentacledInteractions.fromJson(json["interactions"]),
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
   // "interactions": interactions.toJson(),
  };
}

class StickyConnections {
  StickyConnections({
    this.albums,
    this.appearances,
    this.channels,
    this.feed,
    this.followers,
    this.following,
    this.groups,
    this.likes,
    this.membership,
    this.moderatedChannels,
    this.portfolios,
    this.videos,
    this.shared,
    this.pictures,
    this.foldersRoot,
    this.teams,
  });

  Albums albums;
  Albums appearances;
  Albums channels;
  Recommendations feed;
  Albums followers;
  Albums following;
  Albums groups;
  Albums likes;
  Recommendations membership;
  Albums moderatedChannels;
  Albums portfolios;
  Albums videos;
  Albums shared;
  Albums pictures;
  Recommendations foldersRoot;
  Albums teams;

  factory StickyConnections.fromJson(Map<String, dynamic> json) => StickyConnections(
    albums: Albums.fromJson(json["albums"]),
    appearances: Albums.fromJson(json["appearances"]),
    channels: Albums.fromJson(json["channels"]),
    feed: Recommendations.fromJson(json["feed"]),
    followers: Albums.fromJson(json["followers"]),
    following: Albums.fromJson(json["following"]),
    groups: Albums.fromJson(json["groups"]),
    likes: Albums.fromJson(json["likes"]),
    membership: Recommendations.fromJson(json["membership"]),
    moderatedChannels: Albums.fromJson(json["moderated_channels"]),
    portfolios: Albums.fromJson(json["portfolios"]),
    videos: Albums.fromJson(json["videos"]),
    shared: Albums.fromJson(json["shared"]),
    pictures: Albums.fromJson(json["pictures"]),
    foldersRoot: Recommendations.fromJson(json["folders_root"]),
    teams: Albums.fromJson(json["teams"]),
  );

  Map<String, dynamic> toJson() => {
    "albums": albums.toJson(),
    "appearances": appearances.toJson(),
    "channels": channels.toJson(),
    "feed": feed.toJson(),
    "followers": followers.toJson(),
    "following": following.toJson(),
    "groups": groups.toJson(),
    "likes": likes.toJson(),
    "membership": membership.toJson(),
    "moderated_channels": moderatedChannels.toJson(),
    "portfolios": portfolios.toJson(),
    "videos": videos.toJson(),
    "shared": shared.toJson(),
    "pictures": pictures.toJson(),
    "folders_root": foldersRoot.toJson(),
    "teams": teams.toJson(),
  };
}


class Skill {
  Skill({
    this.uri,
    this.name,
  });

  String uri;
  String name;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    uri: json["uri"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
  };
}

class Website {
  Website({
    this.uri,
    this.name,
    this.link,
    this.type,
    this.description,
  });

  String uri;
  String name;
  String link;
  String type;
  String description;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
    uri: json["uri"],
    name: json["name"] == null ? null : json["name"],
    link: json["link"],
    type: json["type"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name == null ? null : name,
    "link": link,
    "type": type,
    "description": description == null ? null : description,
  };
}

class Paging {
  Paging({
    this.next,
    this.previous,
    this.first,
    this.last,
  });

  String next;
  dynamic previous;
  String first;
  String last;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    next: json["next"],
    previous: json["previous"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
    "first": first,
    "last": last,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
/*

import 'dart:convert';
// To parse this JSON data, do
//
//     final vimeoVideo = vimeoVideoFromJson(jsonString);


VimeoVideo vimeoVideoFromJson(String str) => VimeoVideo.fromJson(json.decode(str));

String vimeoVideoToJson(VimeoVideo data) => json.encode(data.toJson());

class VimeoVideo {
  VimeoVideo({
    this.total,
    this.page,
    this.perPage,
    this.paging,
    this.data,
  });

  int total;
  int page;
  int perPage;
  Paging paging;
  List<Datum> data;

  factory VimeoVideo.fromJson(Map<String, dynamic> json) => VimeoVideo(
    total: json["total"],
    page: json["page"],
    perPage: json["per_page"],
    paging: Paging.fromJson(json["paging"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "per_page": perPage,
    "paging": paging.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.uri,
    this.name,
    this.description,
    this.type,
    this.link,
    this.duration,
    this.width,
    this.language,
    this.height,
    this.embed,
    this.createdTime,
    this.modifiedTime,
    this.releaseTime,
    this.contentRating,
    this.license,
    this.privacy,
    this.pictures,
    this.tags,
    this.stats,
    this.categories,
    this.uploader,
    this.metadata,
    this.user,
    this.app,
    this.status,
    this.resourceKey,
    this.upload,
    this.transcode,
    this.isPlayable,
  });

  String uri;
  String name;
  String description;
  String type;
  String link;
  int duration;
  int width;
  dynamic language;
  int height;
  Embed embed;
  DateTime createdTime;
  DateTime modifiedTime;
  DateTime releaseTime;
  List<String> contentRating;
  String license;
  Privacy privacy;
  Pictures pictures;
  List<Tag> tags;
  Stats stats;
  List<Category> categories;
  Uploader uploader;
  DatumMetadata metadata;
  User user;
  dynamic app;
  String status;
  String resourceKey;
  Upload upload;
  Transcode transcode;
  bool isPlayable;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uri: json["uri"],
    name: json["name"],
    description: json["description"],
    type: json["type"],
    link: json["link"],
    duration: json["duration"],
    width: json["width"],
    language: json["language"],
    height: json["height"],
    embed: Embed.fromJson(json["embed"]),
    createdTime: DateTime.parse(json["created_time"]),
    modifiedTime: DateTime.parse(json["modified_time"]),
    releaseTime: DateTime.parse(json["release_time"]),
    contentRating: List<String>.from(json["content_rating"].map((x) => x)),
    license: json["license"] == null ? null : json["license"],
    privacy: Privacy.fromJson(json["privacy"]),
    pictures: Pictures.fromJson(json["pictures"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    stats: Stats.fromJson(json["stats"]),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    uploader: Uploader.fromJson(json["uploader"]),
    metadata: DatumMetadata.fromJson(json["metadata"]),
    user: User.fromJson(json["user"]),
    app: json["app"],
    status: json["status"],
    resourceKey: json["resource_key"],
    upload: Upload.fromJson(json["upload"]),
    transcode: Transcode.fromJson(json["transcode"]),
    isPlayable: json["is_playable"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "description": description,
    "type": type,
    "link": link,
    "duration": duration,
    "width": width,
    "language": language,
    "height": height,
    "embed": embed.toJson(),
    "created_time": createdTime.toIso8601String(),
    "modified_time": modifiedTime.toIso8601String(),
    "release_time": releaseTime.toIso8601String(),
    "content_rating": List<dynamic>.from(contentRating.map((x) => x)),
    "license": license == null ? null : license,
    "privacy": privacy.toJson(),
    "pictures": pictures.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "stats": stats.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "uploader": uploader.toJson(),
    "metadata": metadata.toJson(),
    "user": user.toJson(),
    "app": app,
    "status": status,
    "resource_key": resourceKey,
    "upload": upload.toJson(),
    "transcode": transcode.toJson(),
    "is_playable": isPlayable,
  };
}

class Category {
  Category({
    this.uri,
    this.name,
    this.link,
    this.topLevel,
    this.isDeprecated,
    this.pictures,
    this.lastVideoFeaturedTime,
    this.parent,
    this.metadata,
    this.subcategories,
    this.icon,
    this.resourceKey,
  });

  String uri;
  String name;
  String link;
  bool topLevel;
  bool isDeprecated;
  Pictures pictures;
  DateTime lastVideoFeaturedTime;
  Parent parent;
  CategoryMetadata metadata;
  List<Parent> subcategories;
  Pictures icon;
  String resourceKey;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    uri: json["uri"],
    name: json["name"],
    link: json["link"],
    topLevel: json["top_level"],
    isDeprecated: json["is_deprecated"],
    pictures: Pictures.fromJson(json["pictures"]),
    lastVideoFeaturedTime: DateTime.parse(json["last_video_featured_time"]),
    parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
    metadata: CategoryMetadata.fromJson(json["metadata"]),
    subcategories: json["subcategories"] == null ? null : List<Parent>.from(json["subcategories"].map((x) => Parent.fromJson(x))),
    icon: json["icon"] == null ? null : Pictures.fromJson(json["icon"]),
    resourceKey: json["resource_key"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "link": link,
    "top_level": topLevel,
    "is_deprecated": isDeprecated,
    "pictures": pictures.toJson(),
    "last_video_featured_time": lastVideoFeaturedTime.toIso8601String(),
    "parent": parent == null ? null : parent.toJson(),
    "metadata": metadata.toJson(),
    "subcategories": subcategories == null ? null : List<dynamic>.from(subcategories.map((x) => x.toJson())),
    "icon": icon == null ? null : icon.toJson(),
    "resource_key": resourceKey,
  };
}

class Pictures {
  Pictures({
    this.uri,
    this.active,
    this.type,
    this.sizes,
    this.resourceKey,
    this.defaultPicture,
  });

  String uri;
  bool active;
  Type type;
  List<Size> sizes;
  String resourceKey;
  bool defaultPicture;

  factory Pictures.fromJson(Map<String, dynamic> json) => Pictures(
    uri: json["uri"],
    active: json["active"],
    type: typeValues.map[json["type"]],
    sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
    resourceKey: json["resource_key"],
    defaultPicture: json["default_picture"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "active": active,
    "type": typeValues.reverse[type],
    "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
    "resource_key": resourceKey,
    "default_picture": defaultPicture,
  };
}

class Size {
  Size({
    this.width,
    this.height,
    this.link,
    this.linkWithPlayButton,
  });

  int width;
  int height;
  String link;
  String linkWithPlayButton;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    width: json["width"],
    height: json["height"],
    link: json["link"],
    linkWithPlayButton: json["link_with_play_button"] == null ? null : json["link_with_play_button"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "link": link,
    "link_with_play_button": linkWithPlayButton == null ? null : linkWithPlayButton,
  };
}

enum Type { CUSTOM }

final typeValues = EnumValues({
  "custom": Type.CUSTOM
});

class CategoryMetadata {
  CategoryMetadata({
    this.connections,
    this.interactions,
  });

  PurpleConnections connections;
  PurpleInteractions interactions;

  factory CategoryMetadata.fromJson(Map<String, dynamic> json) => CategoryMetadata(
    connections: PurpleConnections.fromJson(json["connections"]),
    interactions: PurpleInteractions.fromJson(json["interactions"]),
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
    "interactions": interactions.toJson(),
  };
}

class PurpleConnections {
  PurpleConnections({
    this.channels,
    this.groups,
    this.users,
    this.videos,
  });

  Albums channels;
  Albums groups;
  Albums users;
  Albums videos;

  factory PurpleConnections.fromJson(Map<String, dynamic> json) => PurpleConnections(
    channels: Albums.fromJson(json["channels"]),
    groups: Albums.fromJson(json["groups"]),
    users: Albums.fromJson(json["users"]),
    videos: Albums.fromJson(json["videos"]),
  );

  Map<String, dynamic> toJson() => {
    "channels": channels.toJson(),
    "groups": groups.toJson(),
    "users": users.toJson(),
    "videos": videos.toJson(),
  };
}

class Albums {
  Albums({
    this.uri,
    this.options,
    this.total,
  });

  String uri;
  List<AlbumsOption> options;
  int total;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
    uri: json["uri"],
    options: List<AlbumsOption>.from(json["options"].map((x) => albumsOptionValues.map[x])),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "options": List<dynamic>.from(options.map((x) => albumsOptionValues.reverse[x])),
    "total": total,
  };
}

enum AlbumsOption { GET, PATCH, POST }

final albumsOptionValues = EnumValues({
  "GET": AlbumsOption.GET,
  "PATCH": AlbumsOption.PATCH,
  "POST": AlbumsOption.POST
});

class PurpleInteractions {
  PurpleInteractions({
    this.follow,
  });

  Like follow;

  factory PurpleInteractions.fromJson(Map<String, dynamic> json) => PurpleInteractions(
    follow: Like.fromJson(json["follow"]),
  );

  Map<String, dynamic> toJson() => {
    "follow": follow.toJson(),
  };
}

class Like {
  Like({
    this.added,
    this.addedTime,
    this.uri,
    this.options,
  });

  bool added;
  dynamic addedTime;
  String uri;
  List<LikeOption> options;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    added: json["added"],
    addedTime: json["added_time"],
    uri: json["uri"],
    options: json["options"] == null ? null : List<LikeOption>.from(json["options"].map((x) => likeOptionValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "added": added,
    "added_time": addedTime,
    "uri": uri,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => likeOptionValues.reverse[x])),
  };
}

enum LikeOption { GET, PUT, DELETE }

final likeOptionValues = EnumValues({
  "DELETE": LikeOption.DELETE,
  "GET": LikeOption.GET,
  "PUT": LikeOption.PUT
});

class Parent {
  Parent({
    this.uri,
    this.name,
    this.link,
  });

  String uri;
  String name;
  String link;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    uri: json["uri"],
    name: json["name"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "link": link,
  };
}

class Embed {
  Embed({
    this.html,
    this.badges,
  });

  String html;
  Badges badges;

  factory Embed.fromJson(Map<String, dynamic> json) => Embed(
    html: json["html"],
    badges: Badges.fromJson(json["badges"]),
  );

  Map<String, dynamic> toJson() => {
    "html": html,
    "badges": badges.toJson(),
  };
}

class Badges {
  Badges({
    this.hdr,
    this.live,
    this.staffPick,
    this.vod,
    this.weekendChallenge,
  });

  bool hdr;
  Live live;
  StaffPick staffPick;
  bool vod;
  bool weekendChallenge;

  factory Badges.fromJson(Map<String, dynamic> json) => Badges(
    hdr: json["hdr"],
    live: Live.fromJson(json["live"]),
    staffPick: StaffPick.fromJson(json["staff_pick"]),
    vod: json["vod"],
    weekendChallenge: json["weekend_challenge"],
  );

  Map<String, dynamic> toJson() => {
    "hdr": hdr,
    "live": live.toJson(),
    "staff_pick": staffPick.toJson(),
    "vod": vod,
    "weekend_challenge": weekendChallenge,
  };
}

class Live {
  Live({
    this.streaming,
    this.archived,
  });

  bool streaming;
  bool archived;

  factory Live.fromJson(Map<String, dynamic> json) => Live(
    streaming: json["streaming"],
    archived: json["archived"],
  );

  Map<String, dynamic> toJson() => {
    "streaming": streaming,
    "archived": archived,
  };
}

class StaffPick {
  StaffPick({
    this.normal,
    this.bestOfTheMonth,
    this.bestOfTheYear,
    this.premiere,
  });

  bool normal;
  bool bestOfTheMonth;
  bool bestOfTheYear;
  bool premiere;

  factory StaffPick.fromJson(Map<String, dynamic> json) => StaffPick(
    normal: json["normal"],
    bestOfTheMonth: json["best_of_the_month"],
    bestOfTheYear: json["best_of_the_year"],
    premiere: json["premiere"],
  );

  Map<String, dynamic> toJson() => {
    "normal": normal,
    "best_of_the_month": bestOfTheMonth,
    "best_of_the_year": bestOfTheYear,
    "premiere": premiere,
  };
}

class DatumMetadata {
  DatumMetadata({
    this.connections,
    this.interactions,
    this.isVimeoCreate,
    this.isScreenRecord,
  });

  FluffyConnections connections;
  FluffyInteractions interactions;
  bool isVimeoCreate;
  bool isScreenRecord;

  factory DatumMetadata.fromJson(Map<String, dynamic> json) => DatumMetadata(
    connections: FluffyConnections.fromJson(json["connections"]),
    interactions: FluffyInteractions.fromJson(json["interactions"]),
    isVimeoCreate: json["is_vimeo_create"],
    isScreenRecord: json["is_screen_record"],
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
    "interactions": interactions.toJson(),
    "is_vimeo_create": isVimeoCreate,
    "is_screen_record": isScreenRecord,
  };
}

class FluffyConnections {
  FluffyConnections({
    this.comments,
    this.credits,
    this.likes,
    this.pictures,
    this.texttracks,
    this.related,
    this.recommendations,
    this.albums,
    this.availableAlbums,
    this.availableChannels,
  });

  Albums comments;
  Albums credits;
  Albums likes;
  Albums pictures;
  Albums texttracks;
  Recommendations related;
  Recommendations recommendations;
  Albums albums;
  Albums availableAlbums;
  Albums availableChannels;

  factory FluffyConnections.fromJson(Map<String, dynamic> json) => FluffyConnections(
    comments: Albums.fromJson(json["comments"]),
    credits: Albums.fromJson(json["credits"]),
    likes: Albums.fromJson(json["likes"]),
    pictures: Albums.fromJson(json["pictures"]),
    texttracks: Albums.fromJson(json["texttracks"]),
    related: Recommendations.fromJson(json["related"]),
    recommendations: Recommendations.fromJson(json["recommendations"]),
    albums: Albums.fromJson(json["albums"]),
    availableAlbums: Albums.fromJson(json["available_albums"]),
    availableChannels: Albums.fromJson(json["available_channels"]),
  );

  Map<String, dynamic> toJson() => {
    "comments": comments.toJson(),
    "credits": credits.toJson(),
    "likes": likes.toJson(),
    "pictures": pictures.toJson(),
    "texttracks": texttracks.toJson(),
    "related": related.toJson(),
    "recommendations": recommendations.toJson(),
    "albums": albums.toJson(),
    "available_albums": availableAlbums.toJson(),
    "available_channels": availableChannels.toJson(),
  };
}

class Recommendations {
  Recommendations({
    this.uri,
    this.options,
  });

  String uri;
  List<AlbumsOption> options;

  factory Recommendations.fromJson(Map<String, dynamic> json) => Recommendations(
    uri: json["uri"],
    options: List<AlbumsOption>.from(json["options"].map((x) => albumsOptionValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "options": List<dynamic>.from(options.map((x) => albumsOptionValues.reverse[x])),
  };
}

class FluffyInteractions {
  FluffyInteractions({
    this.watchlater,
    this.like,
    this.report,
    this.updatePrivacyToPublic,
  });

  Like watchlater;
  Like like;
  Report report;
  bool updatePrivacyToPublic;

  factory FluffyInteractions.fromJson(Map<String, dynamic> json) => FluffyInteractions(
    watchlater: Like.fromJson(json["watchlater"]),
    like: Like.fromJson(json["like"]),
    report: Report.fromJson(json["report"]),
    updatePrivacyToPublic: json["update_privacy_to_public"],
  );

  Map<String, dynamic> toJson() => {
    "watchlater": watchlater.toJson(),
    "like": like.toJson(),
    "report": report.toJson(),
    "update_privacy_to_public": updatePrivacyToPublic,
  };
}

class Report {
  Report({
    this.uri,
    this.options,
    this.reason,
  });

  String uri;
  List<AlbumsOption> options;
  List<String> reason;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    uri: json["uri"],
    options: List<AlbumsOption>.from(json["options"].map((x) => albumsOptionValues.map[x])),
    reason: List<String>.from(json["reason"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "options": List<dynamic>.from(options.map((x) => albumsOptionValues.reverse[x])),
    "reason": List<dynamic>.from(reason.map((x) => x)),
  };
}

class Privacy {
  Privacy({
    this.view,
    this.embed,
    this.download,
    this.add,
    this.comments,
  });

  String view;
  String embed;
  bool download;
  bool add;
  String comments;

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
    view: json["view"],
    embed: json["embed"],
    download: json["download"],
    add: json["add"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "view": view,
    "embed": embed,
    "download": download,
    "add": add,
    "comments": comments,
  };
}

class Stats {
  Stats({
    this.plays,
  });

  int plays;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    plays: json["plays"],
  );

  Map<String, dynamic> toJson() => {
    "plays": plays,
  };
}

class Tag {
  Tag({
    this.uri,
    this.name,
    this.tag,
    this.canonical,
    this.metadata,
    this.resourceKey,
  });

  String uri;
  String name;
  String tag;
  String canonical;
  TagMetadata metadata;
  String resourceKey;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    uri: json["uri"],
    name: json["name"],
    tag: json["tag"],
    canonical: json["canonical"],
    metadata: TagMetadata.fromJson(json["metadata"]),
    resourceKey: json["resource_key"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "tag": tag,
    "canonical": canonical,
    "metadata": metadata.toJson(),
    "resource_key": resourceKey,
  };
}

class TagMetadata {
  TagMetadata({
    this.connections,
  });

  TentacledConnections connections;

  factory TagMetadata.fromJson(Map<String, dynamic> json) => TagMetadata(
    connections: TentacledConnections.fromJson(json["connections"]),
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
  };
}

class TentacledConnections {
  TentacledConnections({
    this.videos,
  });

  Albums videos;

  factory TentacledConnections.fromJson(Map<String, dynamic> json) => TentacledConnections(
    videos: Albums.fromJson(json["videos"]),
  );

  Map<String, dynamic> toJson() => {
    "videos": videos.toJson(),
  };
}

class Transcode {
  Transcode({
    this.status,
  });

  String status;

  factory Transcode.fromJson(Map<String, dynamic> json) => Transcode(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class Upload {
  Upload({
    this.status,
    this.link,
    this.uploadLink,
    this.completeUri,
    this.form,
    this.approach,
    this.size,
    this.redirectUrl,
  });

  String status;
  dynamic link;
  dynamic uploadLink;
  dynamic completeUri;
  dynamic form;
  dynamic approach;
  dynamic size;
  dynamic redirectUrl;

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
    status: json["status"],
    link: json["link"],
    uploadLink: json["upload_link"],
    completeUri: json["complete_uri"],
    form: json["form"],
    approach: json["approach"],
    size: json["size"],
    redirectUrl: json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "link": link,
    "upload_link": uploadLink,
    "complete_uri": completeUri,
    "form": form,
    "approach": approach,
    "size": size,
    "redirect_url": redirectUrl,
  };
}

class Uploader {
  Uploader({
    this.pictures,
  });

  Pictures pictures;

  factory Uploader.fromJson(Map<String, dynamic> json) => Uploader(
    pictures: Pictures.fromJson(json["pictures"]),
  );

  Map<String, dynamic> toJson() => {
    "pictures": pictures.toJson(),
  };
}

class User {
  User({
    this.uri,
    this.name,
    this.link,
    this.capabilities,
    this.location,
    this.gender,
    this.bio,
    this.shortBio,
    this.createdTime,
    this.pictures,
    this.websites,
    this.metadata,
    this.locationDetails,
    this.skills,
    this.availableForHire,
    this.canWorkRemotely,
    this.resourceKey,
    this.account,
  });

  String uri;
  String name;
  String link;
  Capabilities capabilities;
  String location;
  String gender;
  String bio;
  String shortBio;
  DateTime createdTime;
  Pictures pictures;
  List<Website> websites;
  UserMetadata metadata;
  LocationDetails locationDetails;
  List<Skill> skills;
  bool availableForHire;
  bool canWorkRemotely;
  String resourceKey;
  String account;

  factory User.fromJson(Map<String, dynamic> json) => User(
    uri: json["uri"],
    name: json["name"],
    link: json["link"],
    capabilities: Capabilities.fromJson(json["capabilities"]),
    location: json["location"],
    gender: json["gender"],
    bio: json["bio"],
    shortBio: json["short_bio"] == null ? null : json["short_bio"],
    createdTime: DateTime.parse(json["created_time"]),
    pictures: Pictures.fromJson(json["pictures"]),
    websites: List<Website>.from(json["websites"].map((x) => Website.fromJson(x))),
    metadata: UserMetadata.fromJson(json["metadata"]),
    locationDetails: LocationDetails.fromJson(json["location_details"]),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    availableForHire: json["available_for_hire"],
    canWorkRemotely: json["can_work_remotely"],
    resourceKey: json["resource_key"],
    account: json["account"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "link": link,
    "capabilities": capabilities.toJson(),
    "location": location,
    "gender": gender,
    "bio": bio,
    "short_bio": shortBio == null ? null : shortBio,
    "created_time": createdTime.toIso8601String(),
    "pictures": pictures.toJson(),
    "websites": List<dynamic>.from(websites.map((x) => x.toJson())),
    "metadata": metadata.toJson(),
    "location_details": locationDetails.toJson(),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "available_for_hire": availableForHire,
    "can_work_remotely": canWorkRemotely,
    "resource_key": resourceKey,
    "account": account,
  };
}

class Capabilities {
  Capabilities({
    this.hasLiveSubscription,
    this.hasEnterpriseLihp,
    this.hasSvvTimecodedComments,
  });

  bool hasLiveSubscription;
  bool hasEnterpriseLihp;
  bool hasSvvTimecodedComments;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
    hasLiveSubscription: json["hasLiveSubscription"],
    hasEnterpriseLihp: json["hasEnterpriseLihp"],
    hasSvvTimecodedComments: json["hasSvvTimecodedComments"],
  );

  Map<String, dynamic> toJson() => {
    "hasLiveSubscription": hasLiveSubscription,
    "hasEnterpriseLihp": hasEnterpriseLihp,
    "hasSvvTimecodedComments": hasSvvTimecodedComments,
  };
}

class LocationDetails {
  LocationDetails({
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.neighborhood,
    this.subLocality,
    this.stateIsoCode,
    this.country,
    this.countryIsoCode,
  });

  String formattedAddress;
  double latitude;
  double longitude;
  String city;
  String state;
  dynamic neighborhood;
  dynamic subLocality;
  String stateIsoCode;
  String country;
  String countryIsoCode;

  factory LocationDetails.fromJson(Map<String, dynamic> json) => LocationDetails(
    formattedAddress: json["formatted_address"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    neighborhood: json["neighborhood"],
    subLocality: json["sub_locality"],
    stateIsoCode: json["state_iso_code"] == null ? null : json["state_iso_code"],
    country: json["country"] == null ? null : json["country"],
    countryIsoCode: json["country_iso_code"] == null ? null : json["country_iso_code"],
  );

  Map<String, dynamic> toJson() => {
    "formatted_address": formattedAddress,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "neighborhood": neighborhood,
    "sub_locality": subLocality,
    "state_iso_code": stateIsoCode == null ? null : stateIsoCode,
    "country": country == null ? null : country,
    "country_iso_code": countryIsoCode == null ? null : countryIsoCode,
  };
}

class UserMetadata {
  UserMetadata({
    this.connections,
    this.interactions,
  });

  StickyConnections connections;
  TentacledInteractions interactions;

  factory UserMetadata.fromJson(Map<String, dynamic> json) => UserMetadata(
    connections: StickyConnections.fromJson(json["connections"]),
    interactions: TentacledInteractions.fromJson(json["interactions"]),
  );

  Map<String, dynamic> toJson() => {
    "connections": connections.toJson(),
    "interactions": interactions.toJson(),
  };
}

class StickyConnections {
  StickyConnections({
    this.albums,
    this.appearances,
    this.channels,
    this.feed,
    this.followers,
    this.following,
    this.groups,
    this.likes,
    this.membership,
    this.moderatedChannels,
    this.portfolios,
    this.videos,
    this.shared,
    this.pictures,
    this.foldersRoot,
    this.teams,
  });

  Albums albums;
  Albums appearances;
  Albums channels;
  Recommendations feed;
  Albums followers;
  Albums following;
  Albums groups;
  Albums likes;
  Recommendations membership;
  Albums moderatedChannels;
  Albums portfolios;
  Albums videos;
  Albums shared;
  Albums pictures;
  Recommendations foldersRoot;
  Albums teams;

  factory StickyConnections.fromJson(Map<String, dynamic> json) => StickyConnections(
    albums: Albums.fromJson(json["albums"]),
    appearances: Albums.fromJson(json["appearances"]),
    channels: Albums.fromJson(json["channels"]),
    feed: Recommendations.fromJson(json["feed"]),
    followers: Albums.fromJson(json["followers"]),
    following: Albums.fromJson(json["following"]),
    groups: Albums.fromJson(json["groups"]),
    likes: Albums.fromJson(json["likes"]),
    membership: Recommendations.fromJson(json["membership"]),
    moderatedChannels: Albums.fromJson(json["moderated_channels"]),
    portfolios: Albums.fromJson(json["portfolios"]),
    videos: Albums.fromJson(json["videos"]),
    shared: Albums.fromJson(json["shared"]),
    pictures: Albums.fromJson(json["pictures"]),
    foldersRoot: Recommendations.fromJson(json["folders_root"]),
    teams: Albums.fromJson(json["teams"]),
  );

  Map<String, dynamic> toJson() => {
    "albums": albums.toJson(),
    "appearances": appearances.toJson(),
    "channels": channels.toJson(),
    "feed": feed.toJson(),
    "followers": followers.toJson(),
    "following": following.toJson(),
    "groups": groups.toJson(),
    "likes": likes.toJson(),
    "membership": membership.toJson(),
    "moderated_channels": moderatedChannels.toJson(),
    "portfolios": portfolios.toJson(),
    "videos": videos.toJson(),
    "shared": shared.toJson(),
    "pictures": pictures.toJson(),
    "folders_root": foldersRoot.toJson(),
    "teams": teams.toJson(),
  };
}

class TentacledInteractions {
  TentacledInteractions({
    this.follow,
    this.block,
    this.report,
  });

  Like follow;
  Like block;
  Report report;

  factory TentacledInteractions.fromJson(Map<String, dynamic> json) => TentacledInteractions(
    follow: Like.fromJson(json["follow"]),
    block: Like.fromJson(json["block"]),
    report: Report.fromJson(json["report"]),
  );

  Map<String, dynamic> toJson() => {
    "follow": follow.toJson(),
    "block": block.toJson(),
    "report": report.toJson(),
  };
}

class Skill {
  Skill({
    this.uri,
    this.name,
  });

  String uri;
  String name;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    uri: json["uri"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
  };
}

class Website {
  Website({
    this.uri,
    this.name,
    this.link,
    this.type,
    this.description,
  });

  String uri;
  String name;
  String link;
  String type;
  String description;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
    uri: json["uri"],
    name: json["name"] == null ? null : json["name"],
    link: json["link"],
    type: json["type"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name == null ? null : name,
    "link": link,
    "type": type,
    "description": description == null ? null : description,
  };
}

class Paging {
  Paging({
    this.next,
    this.previous,
    this.first,
    this.last,
  });

  String next;
  dynamic previous;
  String first;
  String last;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    next: json["next"],
    previous: json["previous"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
    "first": first,
    "last": last,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

 */