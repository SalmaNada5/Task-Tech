import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String? status;
  int? results;
  PaginationResult? paginationResult;
  Data? data;

  PostModel({
    this.status,
    this.results,
    this.paginationResult,
    this.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
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
  String id;
  String description;
  User? user;
  String postId;
  final DateTime? createdAt;

  Post({
    required this.id,
    required this.description,
    this.user,
    required this.postId,
    this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        description: json["description"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        postId: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "user": user?.toJson(),
        "id": postId,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class User {
  String photo;
  bool isOnline;
  String id;
  String name;
  String userId;

  User({
    required this.photo,
    required this.isOnline,
    required this.id,
    required this.name,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        photo: json["photo"],
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "isOnline": isOnline,
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

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      PaginationResult(
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
