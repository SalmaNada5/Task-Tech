import 'dart:convert';

ProfilePhoto welcomeFromJson(String str) => ProfilePhoto.fromJson(json.decode(str));

String welcomeToJson(ProfilePhoto data) => json.encode(data.toJson());

class ProfilePhoto {
    String? status;
    ProfilePhotoData? data;

    ProfilePhoto({
        this.status,
        this.data,
    });

    factory ProfilePhoto.fromJson(Map<String, dynamic> json) => ProfilePhoto(
        status: json["status"],
        data: ProfilePhotoData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class ProfilePhotoData {
    Data? data;

    ProfilePhotoData({
        this.data,
    });

    factory ProfilePhotoData.fromJson(Map<String, dynamic> json) => ProfilePhotoData(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    List<dynamic>? skills;
    String? photo;
    List<dynamic>? images;
    String? job;
    String? role;
    double? ratingsAverage;
    int? ratingsQuantity;
    List<dynamic>? followers;
    List<dynamic>? followings;
    bool? isOnline;
    String? id;
    String? name;
    String? email;
    int? v;
    String? resetCode;
    DateTime? resetExpires;
    bool? resetVerified;
    String? cv;
    String? dataId;

    Data({
        this.skills,
        this.photo,
        this.images,
        this.job,
        this.role,
        this.ratingsAverage,
        this.ratingsQuantity,
        this.followers,
        this.followings,
        this.isOnline,
        this.id,
        this.name,
        this.email,
        this.v,
        this.resetCode,
        this.resetExpires,
        this.resetVerified,
        this.cv,
        this.dataId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        photo: json["photo"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        job: json["job"],
        role: json["role"],
        ratingsAverage: json["ratingsAverage"].toDouble(),
        ratingsQuantity: json["ratingsQuantity"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        followings: List<dynamic>.from(json["followings"].map((x) => x)),
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        v: json["__v"],
        resetCode: json["ResetCode"],
        resetExpires: DateTime.parse(json["ResetExpires"]),
        resetVerified: json["ResetVerified"],
        cv: json["cv"],
        dataId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "photo": photo,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "job": job,
        "role": role,
        "ratingsAverage": ratingsAverage,
        "ratingsQuantity": ratingsQuantity,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "followings": List<dynamic>.from(followings!.map((x) => x)),
        "isOnline": isOnline,
        "_id": id,
        "name": name,
        "email": email,
        "__v": v,
        "ResetCode": resetCode,
        "ResetExpires": resetExpires?.toIso8601String(),
        "ResetVerified": resetVerified,
        "cv": cv,
        "id": dataId,
    };
}
