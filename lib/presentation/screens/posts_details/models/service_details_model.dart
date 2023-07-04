import 'dart:convert';

ServiceDetailsModel serviceDetailsModelFromJson(String str) => ServiceDetailsModel.fromJson(json.decode(str));

String serviceDetailsModelToJson(ServiceDetailsModel data) => json.encode(data.toJson());

class ServiceDetailsModel {
    String? status;
    Data? data;

    ServiceDetailsModel({
         this.status,
         this.data,
    });

    factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) => ServiceDetailsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Service service;

    Data({
        required this.service,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        service: Service.fromJson(json["service"]),
    );

    Map<String, dynamic> toJson() => {
        "service": service.toJson(),
    };
}

class Service {
    List<String> softwareTool;
    String id;
    String name;
    String description;
    String delieveryDate;
    int salary;
    String category;
    User user;
    String attachFile;
    DateTime createdAt;
    DateTime updatedAt;
    String slug;
    int v;
    String serviceId;

    Service({
        required this.softwareTool,
        required this.id,
        required this.name,
        required this.description,
        required this.delieveryDate,
        required this.salary,
        required this.category,
        required this.user,
        required this.attachFile,
        required this.createdAt,
        required this.updatedAt,
        required this.slug,
        required this.v,
        required this.serviceId,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        softwareTool: List<String>.from(json["softwareTool"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        delieveryDate: json["delieveryDate"],
        salary: json["salary"],
        category: json["category"],
        user: User.fromJson(json["user"]),
        attachFile: json["attachFile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
        v: json["__v"],
        serviceId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "softwareTool": List<dynamic>.from(softwareTool.map((x) => x)),
        "_id": id,
        "name": name,
        "description": description,
        "delieveryDate": delieveryDate,
        "salary": salary,
        "category": category,
        "user": user.toJson(),
        "attachFile": attachFile,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "slug": slug,
        "__v": v,
        "id": serviceId,
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
