import 'dart:convert';

class CreateProfileModel {
    final String? status;
    final CreateProfileData? data;

    CreateProfileModel({
         this.status,
         this.data,
});

    factory CreateProfileModel.fromRawJson(String str) => CreateProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateProfileModel.fromJson(Map<String, dynamic> json) => CreateProfileModel(
        status: json["status"],
        data: CreateProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class CreateProfileData {
    final ProfileData data;

    CreateProfileData({
        required this.data,
    });

    factory CreateProfileData.fromRawJson(String str) => CreateProfileData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateProfileData.fromJson(Map<String, dynamic> json) => CreateProfileData(
        data: ProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class ProfileData {
    final List<String> skills;
    final String photo;
    final List<dynamic> images;
    final String role;
    final int ratingsQuantity;
    final List<dynamic> followers;
    final List<dynamic> followings;
    final bool isOnline;
    final String id;
    final String name;
    final String email;
    final int v;
    final bool resetVerified;
    final String about;
    final int age;
    final DateTime birthDate;
    final String catogery;
    final String currency;
    final String education;
    final String ferquency;
    final String gender;
    final String location;
    final int maximum;
    final int minimum;
    final String phoneNumber;
    final String dataId;

    ProfileData({
        required this.skills,
        required this.photo,
        required this.images,
        required this.role,
        required this.ratingsQuantity,
        required this.followers,
        required this.followings,
        required this.isOnline,
        required this.id,
        required this.name,
        required this.email,
        required this.v,
        required this.resetVerified,
        required this.about,
        required this.age,
        required this.birthDate,
        required this.catogery,
        required this.currency,
        required this.education,
        required this.ferquency,
        required this.gender,
        required this.location,
        required this.maximum,
        required this.minimum,
        required this.phoneNumber,
        required this.dataId,
    });

    factory ProfileData.fromRawJson(String str) => ProfileData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        skills: List<String>.from(json["skills"].map((x) => x)),
        photo: json["photo"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        role: json["role"],
        ratingsQuantity: json["ratingsQuantity"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        followings: List<dynamic>.from(json["followings"].map((x) => x)),
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        v: json["__v"],
        resetVerified: json["ResetVerified"],
        about: json["about"],
        age: json["age"],
        birthDate: DateTime.parse(json["birthDate"]),
        catogery: json["catogery"],
        currency: json["currency"],
        education: json["education"],
        ferquency: json["ferquency"],
        gender: json["gender"],
        location: json["location"],
        maximum: json["maximum"],
        minimum: json["minimum"],
        phoneNumber: json["phoneNumber"],
        dataId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "photo": photo,
        "images": List<dynamic>.from(images.map((x) => x)),
        "role": role,
        "ratingsQuantity": ratingsQuantity,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "followings": List<dynamic>.from(followings.map((x) => x)),
        "isOnline": isOnline,
        "_id": id,
        "name": name,
        "email": email,
        "__v": v,
        "ResetVerified": resetVerified,
        "about": about,
        "age": age,
        "birthDate": birthDate.toIso8601String(),
        "catogery": catogery,
        "currency": currency,
        "education": education,
        "ferquency": ferquency,
        "gender": gender,
        "location": location,
        "maximum": maximum,
        "minimum": minimum,
        "phoneNumber": phoneNumber,
        "id": dataId,
    };
}
