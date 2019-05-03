// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Data data;
    Meta meta;

    Profile({
        this.data,
        this.meta,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => new Profile(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class Data {
    String id;
    String username;
    String profilePicture;
    String fullName;
    String bio;
    String website;
    bool isBusiness;
    Counts counts;

    Data({
        this.id,
        this.username,
        this.profilePicture,
        this.fullName,
        this.bio,
        this.website,
        this.isBusiness,
        this.counts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => new Data(
        id: json["id"],
        username: json["username"],
        profilePicture: json["profile_picture"],
        fullName: json["full_name"],
        bio: json["bio"],
        website: json["website"],
        isBusiness: json["is_business"],
        counts: Counts.fromJson(json["counts"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "profile_picture": profilePicture,
        "full_name": fullName,
        "bio": bio,
        "website": website,
        "is_business": isBusiness,
        "counts": counts.toJson(),
    };
}

class Counts {
    int media;
    int follows;
    int followedBy;

    Counts({
        this.media,
        this.follows,
        this.followedBy,
    });

    factory Counts.fromJson(Map<String, dynamic> json) => new Counts(
        media: json["media"],
        follows: json["follows"],
        followedBy: json["followed_by"],
    );

    Map<String, dynamic> toJson() => {
        "media": media,
        "follows": follows,
        "followed_by": followedBy,
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
