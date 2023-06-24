
import 'dart:convert';

CategoryModel categoryFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String? status;
    int? results;
    PaginationResult? paginationResult;
    Data? data;

    CategoryModel({
         this.status,
         this.results,
         this.paginationResult,
         this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    List<CategoryElement> category;

    Data({
        required this.category,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: List<CategoryElement>.from(json["category"].map((x) => CategoryElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
    };
}

class CategoryElement {
    String id;
    String name;
    String type;
    int nSkills;
    String photo;
    DateTime createdAt;
    DateTime updatedAt;
    String slug;

    CategoryElement({
        required this.id,
        required this.name,
        required this.type,
        required this.nSkills,
        required this.photo,
        required this.createdAt,
        required this.updatedAt,
        required this.slug,
    });

    factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        nSkills: json["nSkills"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "nSkills": nSkills,
        "photo": photo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "slug": slug,
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
