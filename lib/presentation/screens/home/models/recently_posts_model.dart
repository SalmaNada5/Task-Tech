
import 'dart:convert';

RecentlyPostsModel recentlyPostsModelFromJson(String str) => RecentlyPostsModel.fromJson(json.decode(str));

String recentlyPostsModelToJson(RecentlyPostsModel data) => json.encode(data.toJson());

class RecentlyPostsModel {
    String? status;
    int? results;
    PaginationResult? paginationResult;
    Data? data;

    RecentlyPostsModel({
         this.status,
         this.results,
         this.paginationResult,
         this.data,
    });

    factory RecentlyPostsModel.fromJson(Map<String, dynamic> json) => RecentlyPostsModel(
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
    dynamic user;
    String postId;

    Post({
        required this.id,
        required this.description,
        this.user,
        required this.postId,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        description: json["description"],
        user: json["user"],
        postId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "user": user,
        "id": postId,
    };
}

class PaginationResult {
    int currentPage;
    int limit;
    int numberOfPages;
    int next;

    PaginationResult({
        required this.currentPage,
        required this.limit,
        required this.numberOfPages,
        required this.next,
    });

    factory PaginationResult.fromJson(Map<String, dynamic> json) => PaginationResult(
        currentPage: json["currentPage"],
        limit: json["limit"],
        numberOfPages: json["numberOfPages"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "limit": limit,
        "numberOfPages": numberOfPages,
        "next": next,
    };
}
