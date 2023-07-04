import 'dart:convert';

RelatedPostModel relatedPostModelFromJson(String str) => RelatedPostModel.fromJson(json.decode(str));

String relatedPostModelToJson(RelatedPostModel data) => json.encode(data.toJson());

class RelatedPostModel {
    String? status;
    int? results;
    PaginationResult? paginationResult;
    Data? data;

    RelatedPostModel({
        this.status,
          this.results,
         this.paginationResult,
        this.data,
    });

    factory RelatedPostModel.fromJson(Map<String, dynamic> json) => RelatedPostModel(
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
    List<Post> posts;

    Data({
        required this.posts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    List<String> softwareTool;
    List<dynamic> saved;
    String id;
    String name;
    String description;
    String delieveryDate;
    int salary;
    String catogery;
    User user;
    String attachFile;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String postId;

    Post({
        required this.softwareTool,
        required this.saved,
        required this.id,
        required this.name,
        required this.description,
        required this.delieveryDate,
        required this.salary,
        required this.catogery,
        required this.user,
        required this.attachFile,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.postId,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        softwareTool: List<String>.from(json["softwareTool"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        delieveryDate: json["delieveryDate"],
        salary: json["salary"],
        catogery: json["catogery"],
        user: User.fromJson(json["user"]),
        attachFile: json["attachFile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        postId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "softwareTool": List<dynamic>.from(softwareTool.map((x) => x)),
        "saved": List<dynamic>.from(saved.map((x) => x)),
        "_id": id,
        "name": name,
        "description": description,
        "delieveryDate": delieveryDate,
        "salary": salary,
        "catogery": catogery,
        "user": user.toJson(),
        "attachFile": attachFile,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": postId,
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

class User {
    String photo;
    double ratingsAverage;
    double ratingsQuantity;
    bool isOnline;
    String id;
    String name;
    String userId;

    User({
        required this.photo,
        required this.ratingsAverage,
        required this.ratingsQuantity,
        required this.isOnline,
        required this.id,
        required this.name,
        required this.userId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        photo: json["photo"],
        ratingsAverage: json["ratingsAverage"],
        ratingsQuantity: json["ratingsQuantity"],
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "photo": photo,
        "ratingsAverage": ratingsAverage,
        "ratingsQuantity": ratingsQuantity,
        "isOnline": isOnline,
        "_id": id,
        "name": name,
        "id": userId,
    };


}
