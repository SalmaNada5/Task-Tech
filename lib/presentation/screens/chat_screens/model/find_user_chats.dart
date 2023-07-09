// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserChatsModel welcomeFromJson(String str) => UserChatsModel.fromJson(json.decode(str));

String welcomeToJson(UserChatsModel data) => json.encode(data.toJson());

class UserChatsModel {
    String? status;
    Data? data;

    UserChatsModel({
         this.status,
         this.data,
    });

    factory UserChatsModel.fromJson(Map<String, dynamic> json) => UserChatsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    List<dynamic> chat;

    Data({
        required this.chat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        chat: List<dynamic>.from(json["chat"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "chat": List<dynamic>.from(chat.map((x) => x)),
    };
}
