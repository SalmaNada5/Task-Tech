import 'dart:convert';

CommentsModel commentsModelFromJson(String str) =>
    CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  String? status;
  int? results;
  Data? data;

  CommentsModel({
    this.status,
    this.results,
    this.data,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        status: json["status"],
        results: json["results"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "data": data?.toJson(),
      };
}

class Data {
  List<Comment> comments;

  Data({
    required this.comments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  String id;
  String text;
  String post;
  User user;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String commentId;

  Comment({
    required this.id,
    required this.text,
    required this.post,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.commentId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        text: json["text"],
        post: json["post"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        commentId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "post": post,
        "user": user.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": commentId,
      };
}

class User {
  String photo;
  double ratingsAverage;
  bool isOnline;
  String id;
  String name;
  String userId;

  User({
    required this.photo,
    required this.ratingsAverage,
    required this.isOnline,
    required this.id,
    required this.name,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        photo: json["photo"],
        ratingsAverage: json["ratingsAverage"]?.toDouble(),
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "ratingsAverage": ratingsAverage,
        "isOnline": isOnline,
        "_id": id,
        "name": name,
        "id": userId,
      };
}
