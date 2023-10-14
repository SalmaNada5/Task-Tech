import 'dart:convert';

TaskDetailsModel taskDetailsModelFromJson(String str) =>
    TaskDetailsModel.fromJson(json.decode(str));

String taskDetailsModelToJson(TaskDetailsModel data) =>
    json.encode(data.toJson());

class TaskDetailsModel {
  String? status;
  Data? data;

  TaskDetailsModel({
    this.status,
    this.data,
  });

  factory TaskDetailsModel.fromJson(Map<String, dynamic> json) =>
      TaskDetailsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Post post;

  Data({
    required this.post,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        post: Post.fromJson(json["post"]),
      );

  Map<String, dynamic> toJson() => {
        "post": post.toJson(),
      };
}

class Post {
  List<String>? softwareTool;
  List<dynamic>? saved;
  String? id;
  String? name;
  String? description;
  String? delieveryDate;
  int? salary;
  String? catogery;
  User? user;
  String? attachFile;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Comment>? comments;
  String? postId;

  Post({
    this.softwareTool,
    this.saved,
    this.id,
    this.name,
    this.description,
    this.delieveryDate,
    this.salary,
    this.catogery,
    this.user,
    this.attachFile,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.comments,
    this.postId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        softwareTool: json["softwareTool"] == null
            ? []
            : List<String>.from(json["softwareTool"].map((x) => x)),
        saved: json["saved"] == null
            ? []
            : List<dynamic>.from(json["saved"].map((x) => x)),
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
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        postId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "softwareTool": List<dynamic>.from(softwareTool!.map((x) => x)),
        "saved": List<dynamic>.from(saved!.map((x) => x)),
        "_id": id,
        "name": name,
        "description": description,
        "delieveryDate": delieveryDate,
        "salary": salary,
        "catogery": catogery,
        "user": user?.toJson(),
        "attachFile": attachFile,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "id": postId,
      };
}

class Comment {
  String? id;
  String? text;
  User? user;
  String? post;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? commentId;

  Comment({
    this.id,
    this.text,
    this.user,
    this.post,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.commentId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        text: json["text"],
        user: User.fromJson(json["user"]),
        post: json["post"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        commentId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "user": user?.toJson(),
        "post": post,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": commentId,
      };
}

class User {
  String? photo;
  num? ratingsAverage;
  bool? isOnline;
  String? id;
  String? name;
  String? userId;
  int? ratingsQuantity;

  User({
    this.photo,
    this.ratingsAverage,
    this.isOnline,
    this.id,
    this.name,
    this.userId,
    this.ratingsQuantity,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        photo: json["photo"],
        ratingsAverage: json["ratingsAverage"],
        isOnline: json["isOnline"],
        id: json["_id"],
        name: json["name"],
        userId: json["id"],
        ratingsQuantity: json["ratingsQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "ratingsAverage": ratingsAverage,
        "isOnline": isOnline,
        "_id": id,
        "name": name,
        "id": userId,
        "ratingsQuantity": ratingsQuantity,
      };
}
