import 'dart:convert';

TopUserModel topUserFromJson(String str) => TopUserModel.fromJson(json.decode(str));

String topUserToJson(TopUserModel data) => json.encode(data.toJson());

class TopUserModel {
    String? status;
    int? results;
    PaginationResult? paginationResult;
    Data? data;

    TopUserModel({
         this.status,
         this.results,
         this.paginationResult,
         this.data,
    });

    factory TopUserModel.fromJson(Map<String, dynamic> json) => TopUserModel(
        status: json["status"],
        results: json["results"],
        paginationResult: PaginationResult.fromJson(json["paginationResult"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "paginationResult": paginationResult?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    List<User> users;

    Data({
        required this.users,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    List<dynamic> skills;
    String photo;
    String job;
    double ratingsAverage;
    double ratingsQuantity;
    String id;
    String name;
    String userId;

    User({
        required this.skills,
        required this.photo,
        required this.job,
        required this.ratingsAverage,
        required this.ratingsQuantity,
        required this.id,
        required this.name,
        required this.userId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        photo: json["photo"],
        job: json["job"],
        ratingsAverage: json["ratingsAverage"]?.toDouble(),
        ratingsQuantity: json["ratingsQuantity"],
        id: json["_id"],
        name: json["name"],
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "photo": photo,
        "job": job,
        "ratingsAverage": ratingsAverage,
        "ratingsQuantity": ratingsQuantity,
        "_id": id,
        "name": name,
        "id": userId,
    };
}

class PaginationResult {
    int currentPage;
    int limit;
    int numberOfPages;

    PaginationResult({
        required this.currentPage,
        required this.limit,
        required this.numberOfPages,
    });

    factory PaginationResult.fromJson(Map<String, dynamic> json) => PaginationResult(
        currentPage: json["currentPage"],
        limit: json["limit"],
        numberOfPages: json["numberOfPages"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "limit": limit,
        "numberOfPages": numberOfPages,
    };
}