import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  String? status;
  Data? data;

  UserInfoModel({
    this.status,
    this.data,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
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
  List<String>? images;
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
  String? cv;
  String? about;
  int? age;
  DateTime? birthDate;
  String? catogery;
  String? currency;
  String? education;
  String? gender;
  String? location;
  int? maximum;
  int? minimum;
  String? phoneNumber;
  List<Review>? reviews;
  String? userId;

  User({
    this.skills,
    this.photo,
    this.images,
    this.job,
    this.role,
    this.ratingsQuantity,
    this.ratingsAverage,
    this.followers,
    this.followings,
    this.isOnline,
    this.id,
    this.name,
    this.email,
    this.v,
    this.resetVerified,
    this.cv,
    this.about,
    this.age,
    this.birthDate,
    this.catogery,
    this.currency,
    this.education,
    this.gender,
    this.location,
    this.maximum,
    this.minimum,
    this.phoneNumber,
    this.reviews,
    this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"].map((x) => x)),
        photo: json["photo"],
        images:json["images"] == null ? [] : List<String>.from(json["images"].map((x) => x)),
        job: json["job"],
        role: json["role"],
        ratingsAverage: json["ratingsAverage"],
        ratingsQuantity: json["ratingsQuantity"],
        followers:json["followers"] == null ? [] : List<dynamic>.from(json["followers"].map((x) => x)),
        followings:json["followings"] == null ? [] : List<dynamic>.from(json["followings"].map((x) => x)),
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        v: json["__v"],
        resetVerified: json["ResetVerified"],
        cv: json["cv"],
        about: json["about"],
        age: json["age"],
        birthDate: json["birthDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["birthDate"]),
        catogery: json["catogery"],
        currency: json["currency"],
        education: json["education"],
        gender: json["gender"],
        location: json["location"],
        maximum: json["maximum"],
        minimum: json["minimum"],
        phoneNumber: json["phoneNumber"],
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
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
        "cv": cv,
        "about": about,
        "age": age,
        "birthDate": birthDate!.toIso8601String(),
        "catogery": catogery,
        "currency": currency,
        "education": education,
        "gender": gender,
        "location": location,
        "maximum": maximum,
        "minimum": minimum,
        "phoneNumber": phoneNumber,
        "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "id": userId,
      };
}

class Review {
  String? id;
  String? review;
  int? rating;
  String? reviewee;
  Reviewer? reviewer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? reviewId;

  Review({
    this.id,
    this.review,
    this.rating,
    this.reviewee,
    this.reviewer,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reviewId,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        review: json["review"],
        rating: json["rating"],
        reviewee: json["reviewee"],
        reviewer: json["reviewer"] == null
            ? null
            : Reviewer.fromJson(json["reviewer"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        reviewId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "review": review,
        "rating": rating,
        "reviewee": reviewee,
        "reviewer": reviewer?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": reviewId,
      };
}

class Reviewer {
  String? photo;
  String? id;
  String? name;
  String? reviewerId;

  Reviewer({
    this.photo,
    this.id,
    this.name,
    this.reviewerId,
  });

  factory Reviewer.fromJson(Map<String, dynamic> json) => Reviewer(
        photo: json["photo"],
        id: json["_id"],
        name: json["name"],
        reviewerId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "_id": id,
        "name": name,
        "id": reviewerId,
      };
}
