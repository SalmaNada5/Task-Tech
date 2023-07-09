// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GetCurrentUser welcomeFromJson(String str) => GetCurrentUser.fromJson(json.decode(str));

String welcomeToJson(GetCurrentUser data) => json.encode(data.toJson());

class GetCurrentUser {
    String? status;
    Data? data;

    GetCurrentUser({
         this.status,
         this.data,
    });

    factory GetCurrentUser.fromJson(Map<String, dynamic> json) => GetCurrentUser(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    User user;

    Data({
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    List<String>? skills;
    String? photo;
    List<dynamic>? images;
    String? job;
    String? role;
    int? ratingsAverage;
    int? ratingsQuantity;
    List<dynamic>? followers;
    List<dynamic>? followings;
    bool? isOnline;
    String? id;
    String? name;
    String? email;
    int? v;
    bool? resetVerified;
    String? about;
    int? age;
    DateTime? birthDate;
    String? catogery;
    String? currency;
    String? education;
    String? ferquency;
    String? gender;
    String? location;
    int? maximum;
    int? minimum;
    String? phoneNumber;
    List<dynamic>? reviews;
    String? userId;

    User({
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
         this.resetVerified,
         this.about,
         this.age,
         this.birthDate,
         this.catogery,
         this.currency,
         this.education,
         this.ferquency,
         this.gender,
         this.location,
         this.maximum,
         this.minimum,
         this.phoneNumber,
         this.reviews,
         this.userId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        skills: List<String>.from(json["skills"].map((x) => x)),
        photo: json["photo"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        job: json["job"],
        role: json["role"],
        ratingsAverage: json["ratingsAverage"],
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
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        userId: json["id"],
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
        "ResetVerified": resetVerified,
        "about": about,
        "age": age,
        "birthDate": birthDate!.toIso8601String(),
        "catogery": catogery,
        "currency": currency,
        "education": education,
        "ferquency": ferquency,
        "gender": gender,
        "location": location,
        "maximum": maximum,
        "minimum": minimum,
        "phoneNumber": phoneNumber,
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
        "id": userId,
    };
}
