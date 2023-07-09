import 'dart:convert';

GetMessageModel welcomeFromJson(String str) => GetMessageModel.fromJson(json.decode(str));

String welcomeToJson(GetMessageModel data) => json.encode(data.toJson());
//Get message model
class GetMessageModel {
    String? status;
    Data? data;

    GetMessageModel({
         this.status,
         this.data,
    });

    factory GetMessageModel.fromJson(Map<String, dynamic> json) => GetMessageModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    List<dynamic> messages;

    Data({
        required this.messages,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x)),
    };
}

 //add message model

 // To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);




class AddMessageModel {
    String? status;
    Data? data;

    AddMessageModel({
         this.status,
         this.data,
    });

    factory AddMessageModel.fromJson(Map<String, dynamic> json) => AddMessageModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class DataMsg {
    Message message;

    DataMsg({
        required this.message,
    });

    factory DataMsg.fromJson(Map<String, dynamic> json) => DataMsg(
        message: Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message.toJson(),
    };
}

class Message {
    String id;
    String chatId;
    String senderId;
    String text;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Message({
        required this.id,
        required this.chatId,
        required this.senderId,
        required this.text,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        chatId: json["chatId"],
        senderId: json["senderId"],
        text: json["text"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chatId": chatId,
        "senderId": senderId,
        "text": text,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
