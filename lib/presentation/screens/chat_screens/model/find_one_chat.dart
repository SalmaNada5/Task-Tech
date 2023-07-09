// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OneChatModel welcomeFromJson(String str) => OneChatModel.fromJson(json.decode(str));

String welcomeToJson(OneChatModel data) => json.encode(data.toJson());

class OneChatModel {
    String? status;
    Data? data;

    OneChatModel({
         this.status,
         this.data,
    });

    factory OneChatModel.fromJson(Map<String, dynamic> json) => OneChatModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    dynamic chat;

    Data({
        this.chat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        chat: json["chat"],
    );

    Map<String, dynamic> toJson() => {
        "chat": chat,
    };
}
