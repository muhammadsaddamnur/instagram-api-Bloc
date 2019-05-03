// To parse this JSON data, do
//
//     final media = mediaFromJson(jsonString);

import 'dart:convert';

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));

String mediaToJson(Media data) => json.encode(data.toJson());

class Media {
  Pagination pagination;
  List<Datum> data;
  Meta meta;

  Media({
    this.pagination,
    this.data,
    this.meta,
  });

  factory Media.fromJson(Map<String, dynamic> json) => new Media(
        pagination: Pagination.fromJson(json["pagination"]),
        data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  String id;
  FromClass user;
  Images images;
  String createdTime;
  Caption caption;
  bool userHasLiked;
  Comments likes;
  List<String> tags;
  String filter;
  Comments comments;
  Type type;
  String link;
  Location location;
  dynamic attribution;
  List<UsersInPhoto> usersInPhoto;
  List<CarouselMedia> carouselMedia;
  Videos videos;

  Datum({
    this.id,
    this.user,
    this.images,
    this.createdTime,
    this.caption,
    this.userHasLiked,
    this.likes,
    this.tags,
    this.filter,
    this.comments,
    this.type,
    this.link,
    this.location,
    this.attribution,
    this.usersInPhoto,
    this.carouselMedia,
    this.videos,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        id: json["id"],
        user: FromClass.fromJson(json["user"]),
        images: Images.fromJson(json["images"]),
        createdTime: json["created_time"],
        caption:
            json["caption"] == null ? null : Caption.fromJson(json["caption"]),
        userHasLiked: json["user_has_liked"],
        likes: Comments.fromJson(json["likes"]),
        tags: new List<String>.from(json["tags"].map((x) => x)),
        filter: json["filter"],
        comments: Comments.fromJson(json["comments"]),
        type: typeValues.map[json["type"]],
        link: json["link"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        attribution: json["attribution"],
        usersInPhoto: new List<UsersInPhoto>.from(
            json["users_in_photo"].map((x) => UsersInPhoto.fromJson(x))),
        carouselMedia: json["carousel_media"] == null
            ? null
            : new List<CarouselMedia>.from(
                json["carousel_media"].map((x) => CarouselMedia.fromJson(x))),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "images": images.toJson(),
        "created_time": createdTime,
        "caption": caption == null ? null : caption.toJson(),
        "user_has_liked": userHasLiked,
        "likes": likes.toJson(),
        "tags": new List<dynamic>.from(tags.map((x) => x)),
        "filter": filter,
        "comments": comments.toJson(),
        "type": typeValues.reverse[type],
        "link": link,
        "location": location == null ? null : location.toJson(),
        "attribution": attribution,
        "users_in_photo":
            new List<dynamic>.from(usersInPhoto.map((x) => x.toJson())),
        "carousel_media": carouselMedia == null
            ? null
            : new List<dynamic>.from(carouselMedia.map((x) => x.toJson())),
        "videos": videos == null ? null : videos.toJson(),
      };
}

class Caption {
  String id;
  String text;
  String createdTime;
  FromClass from;

  Caption({
    this.id,
    this.text,
    this.createdTime,
    this.from,
  });

  factory Caption.fromJson(Map<String, dynamic> json) => new Caption(
        id: json["id"],
        text: json["text"],
        createdTime: json["created_time"],
        from: FromClass.fromJson(json["from"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "created_time": createdTime,
        "from": from.toJson(),
      };
}

class FromClass {
  String id;
  FullName fullName;
  String profilePicture;
  Username username;

  FromClass({
    this.id,
    this.fullName,
    this.profilePicture,
    this.username,
  });

  factory FromClass.fromJson(Map<String, dynamic> json) => new FromClass(
        id: json["id"],
        fullName: fullNameValues.map[json["full_name"]],
        profilePicture: json["profile_picture"],
        username: usernameValues.map[json["username"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullNameValues.reverse[fullName],
        "profile_picture": profilePicture,
        "username": usernameValues.reverse[username],
      };
}

enum FullName { MUHAMMAD_SADDAM_NUR }

final fullNameValues =
    new EnumValues({"Muhammad Saddam Nur": FullName.MUHAMMAD_SADDAM_NUR});

enum Username { SADDAMNUR }

final usernameValues = new EnumValues({"saddamnur": Username.SADDAMNUR});

class CarouselMedia {
  Images images;
  List<UsersInPhoto> usersInPhoto;
  Type type;

  CarouselMedia({
    this.images,
    this.usersInPhoto,
    this.type,
  });

  factory CarouselMedia.fromJson(Map<String, dynamic> json) =>
      new CarouselMedia(
        images: Images.fromJson(json["images"]),
        usersInPhoto: new List<UsersInPhoto>.from(
            json["users_in_photo"].map((x) => UsersInPhoto.fromJson(x))),
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "images": images.toJson(),
        "users_in_photo":
            new List<dynamic>.from(usersInPhoto.map((x) => x.toJson())),
        "type": typeValues.reverse[type],
      };
}

class Images {
  LowResolution thumbnail;
  LowResolution lowResolution;
  LowResolution standardResolution;

  Images({
    this.thumbnail,
    this.lowResolution,
    this.standardResolution,
  });

  factory Images.fromJson(Map<String, dynamic> json) => new Images(
        thumbnail: LowResolution.fromJson(json["thumbnail"]),
        lowResolution: LowResolution.fromJson(json["low_resolution"]),
        standardResolution: LowResolution.fromJson(json["standard_resolution"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "low_resolution": lowResolution.toJson(),
        "standard_resolution": standardResolution.toJson(),
      };
}

class LowResolution {
  int width;
  int height;
  String url;
  String id;

  LowResolution({
    this.width,
    this.height,
    this.url,
    this.id,
  });

  factory LowResolution.fromJson(Map<String, dynamic> json) =>
      new LowResolution(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "id": id == null ? null : id,
      };
}

enum Type { CAROUSEL, IMAGE, VIDEO }

final typeValues = new EnumValues(
    {"carousel": Type.CAROUSEL, "image": Type.IMAGE, "video": Type.VIDEO});

class UsersInPhoto {
  UsersInPhotoUser user;
  Position position;

  UsersInPhoto({
    this.user,
    this.position,
  });

  factory UsersInPhoto.fromJson(Map<String, dynamic> json) => new UsersInPhoto(
        user: UsersInPhotoUser.fromJson(json["user"]),
        position: Position.fromJson(json["position"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "position": position.toJson(),
      };
}

class Position {
  double x;
  double y;

  Position({
    this.x,
    this.y,
  });

  factory Position.fromJson(Map<String, dynamic> json) => new Position(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class UsersInPhotoUser {
  String username;

  UsersInPhotoUser({
    this.username,
  });

  factory UsersInPhotoUser.fromJson(Map<String, dynamic> json) =>
      new UsersInPhotoUser(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}

class Comments {
  int count;

  Comments({
    this.count,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => new Comments(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class Location {
  double latitude;
  double longitude;
  String name;
  int id;

  Location({
    this.latitude,
    this.longitude,
    this.name,
    this.id,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "id": id,
      };
}

class Videos {
  LowResolution standardResolution;
  LowResolution lowBandwidth;
  LowResolution lowResolution;

  Videos({
    this.standardResolution,
    this.lowBandwidth,
    this.lowResolution,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => new Videos(
        standardResolution: LowResolution.fromJson(json["standard_resolution"]),
        lowBandwidth: LowResolution.fromJson(json["low_bandwidth"]),
        lowResolution: LowResolution.fromJson(json["low_resolution"]),
      );

  Map<String, dynamic> toJson() => {
        "standard_resolution": standardResolution.toJson(),
        "low_bandwidth": lowBandwidth.toJson(),
        "low_resolution": lowResolution.toJson(),
      };
}

class Meta {
  int code;

  Meta({
    this.code,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => new Meta(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Pagination {
  Pagination();

  factory Pagination.fromJson(Map<String, dynamic> json) => new Pagination();

  Map<String, dynamic> toJson() => {};
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
