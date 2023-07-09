import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

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
    List<String> skills;
    String photo;
    List<dynamic> images;
    String job;
    String role;
    num ratingsAverage;
    int ratingsQuantity;
    List<dynamic> followers;
    List<dynamic> followings;
    bool isOnline;
    String id;
    String name;
    String email;
    int v;
    bool resetVerified;
    String about;
    int age;
    DateTime birthDate;
    String catogery;
    String currency;
    String education;
    String ferquency;
    String gender;
    String location;
    int maximum;
    int minimum;
    String phoneNumber;
    List<dynamic> reviews;
    String userId;

    User({
        required this.skills,
        required this.photo,
        required this.images,
        required this.job,
        required this.role,
        required this.ratingsAverage,
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
        required this.reviews,
        required this.userId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        skills: List<String>.from(json["skills"].map((x) => x)),
        photo: json["photo"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        job: json["job"],
        role: json["role"],
        ratingsAverage: json["ratingsAverage"]?.toDouble(),
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
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "photo": photo,
        "images": List<dynamic>.from(images.map((x) => x)),
        "job": job,
        "role": role,
        "ratingsAverage": ratingsAverage,
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
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "id": userId,
    };
}
