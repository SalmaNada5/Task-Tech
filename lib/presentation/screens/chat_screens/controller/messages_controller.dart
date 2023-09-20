import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/chat_screens/controller/chat_body.dart';
import 'package:task_tech/presentation/screens/chat_screens/model/message_model.dart';

class MessageController {
  static final DioClient _dioClient = DioClient();
  static GetMessageModel getmsgModel = GetMessageModel();
  static AddMessageModel addmsgModel = AddMessageModel();
  static List<dynamic> msglist = [];

  static ScrollController scrollController = ScrollController();

  static Future<List<dynamic>?> getMessages(
      {bool dioLoading = true, String? msgId}) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    try {
      Response res = await _dioClient.get('api/v1/messages/$msgId', token,
          isLoading: dioLoading) as Response;
      getmsgModel = GetMessageModel.fromJson(res.data);
      msglist.addAll(getmsgModel.data!.messages);
      logSuccess('messages returned successfully: ${getmsgModel.status}');
      return msglist;
    } catch (e) {
      logError('error in get Messages ${e.toString()}');
    }
    return null;
  }

  static Future<bool?> addMessages(
      String text, String chatId, String senderId) async {
    try {
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      Response res = await _dioClient.post('api/v1/messages', token,
          body: ChatBody.messageMap(
              text: text, chatId: chatId, senderId: senderId)) as Response;
      logSuccess('messages added successfully : ${res.statusCode}');
      return true;
    } catch (e) {
      logError('error in add message: $e');
    }
    return false;
  }
}
