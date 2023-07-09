// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CreateChatModel welcomeFromJson(String str) => CreateChatModel.fromJson(json.decode(str));

String welcomeToJson(CreateChatModel data) => json.encode(data.toJson());

class CreateChatModel {
    String? status;
    Data? data;

    CreateChatModel({
         this.status,
         this.data,
    });

    factory CreateChatModel.fromJson(Map<String, dynamic> json) => CreateChatModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    Chat chat;

    Data({
        required this.chat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        chat: Chat.fromJson(json["chat"]),
    );

    Map<String, dynamic> toJson() => {
        "chat": chat.toJson(),
    };
}

class Chat {
    List<String> members;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Chat({
        required this.members,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        members: List<String>.from(json["members"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "members": List<dynamic>.from(members.map((x) => x)),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
