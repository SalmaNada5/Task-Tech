import 'dart:convert';
AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));
String authModelToJson(AuthModel data) => json.encode(data.toJson());
class AuthModel {
  final String? status;
  final String? token;
  final Data? data;
  AuthModel({
    this.status,
    this.token,
    this.data,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"],
        token: json["token"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data?.toJson(),
      };
}
class Data {
  final User? user;
  Data({
    this.user,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),};}
class User {
  final List<String>? skills;
  final String? photo;
  final List<String>? images;
  final String? role;
  final int? ratingsQuantity;
  final List<dynamic>? followers;
  final List<String>? followings;
  final bool? isOnline, active;
  final String? id;
  final String? name;
  final String? email;
  final int? v;
  final String? cv;
  final String? education;
  final int? age;
  final DateTime? birthDate;
  final String? gender;
  final String? location;
  final String? phoneNumber;
  final String? about;
  final String? catogery;
  final String? currency;
  final String? ferquency;
  final int? maximum;
  final int? minimum;
  final DateTime? createdAt;
  final String? userId;
  User({
    this.skills,
    this.photo,
    this.images,
    this.role,
    this.ratingsQuantity,
    this.followers,
    this.followings,
    this.isOnline,
    this.id,
    this.name,
    this.email,
    this.v,
    this.cv,
    this.education,
    this.age,
    this.birthDate,
    this.gender,
    this.location,
    this.phoneNumber,
    this.about,
    this.catogery,
    this.currency,
    this.ferquency,
    this.maximum,
    this.minimum,
    this.createdAt,
    this.userId,
    this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        active: json['active'],
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        photo: json["photo"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        role: json["role"],
        ratingsQuantity: json["ratingsQuantity"],
        followers: json["followers"] == null
            ? []
            : List<dynamic>.from(json["followers"]!.map((x) => x)),
        followings: json["followings"] == null
            ? []
            : List<String>.from(json["followings"]!.map((x) => x)),
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        v: json["__v"],
        cv: json["cv"],
        education: json["education"],
        age: json["age"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        gender: json["gender"],
        location: json["location"],
        phoneNumber: json["phoneNumber"],
        about: json["about"],
        catogery: json["catogery"],
        currency: json["currency"],
        ferquency: json["ferquency"],
        maximum: json["maximum"],
        minimum: json["minimum"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        'active': active,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "photo": photo,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "role": role,
        "ratingsQuantity": ratingsQuantity,
        "followers": followers == null
            ? []
            : List<dynamic>.from(followers!.map((x) => x)),
        "followings": followings == null
            ? []
            : List<dynamic>.from(followings!.map((x) => x)),
        "isOnline": isOnline,
        "_id": id,
        "name": name,
        "email": email,
        "__v": v,
        "cv": cv,
        "education": education,
        "age": age,
        "birthDate": birthDate?.toIso8601String(),
        "gender": gender,
        "location": location,
        "phoneNumber": phoneNumber,
        "about": about,
        "catogery": catogery,
        "currency": currency,
        "ferquency": ferquency,
        "maximum": maximum,
        "minimum": minimum,
        "createdAt": createdAt?.toIso8601String(),
        "id": userId,
      };
}
