// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tech/core/dio/dio_client.dart';
import 'package:task_tech/core/errors/logger.dart';
import 'package:task_tech/presentation/screens/chat_screens/controller/chat_body.dart';
import 'package:task_tech/presentation/screens/chat_screens/model/create_chat.dart';
import 'package:task_tech/presentation/screens/chat_screens/model/find_one_chat.dart';
import 'package:task_tech/presentation/screens/chat_screens/model/find_user_chats.dart';

class ChatController{
    static final DioClient _dioClient = DioClient();
    static UserChatsModel userChatModel = UserChatsModel();
    static OneChatModel oneChatModel = OneChatModel();
    static CreateChatModel createChatModel = CreateChatModel();
    static List<dynamic> userChats =[];
    

    static Future<List<dynamic>?> findUserChats({bool dioLoading=true, String? userId})async{
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    try {
      Response res = await _dioClient.get(
        'api/v1/chats/$userId',
         token,
         isLoading: dioLoading)as Response;
         userChatModel = UserChatsModel.fromJson(res.data);
         userChats.addAll(userChatModel.data!.chat);
         logSuccess('user chats returned successfully : ${userChatModel.status}');
         return userChats;
      
    } catch (e) {
                 logError('error in get user chats ${e.toString()}');

    }
    return null;
    }

     static Future<dynamic> findOneChat({bool dioLoading=true, String? onechatId})async{
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    try {
      Response res = await _dioClient.get(
        'api/v1/chats/find/$onechatId',
         token,
         isLoading: dioLoading)as Response;
         oneChatModel = OneChatModel.fromJson(res.data);
         logSuccess('one chat returned successfully : ${oneChatModel.status}');
         return oneChatModel;
      
    } catch (e) {
                 logError('error in get one chat ${e.toString()}');

    }
    return null;
    }


static Future<bool?> createChat(String senderId,
 String receiverId)async{
  try {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Response res = await _dioClient.post(
      'api/v1/chats',
       token,
       body: ChatBody.chatMap(senderId: senderId, receiverId: receiverId))as Response;
       logSuccess('chat added successfully : ${res.statusCode}');
       return true;

    
  } catch (e) {
    logError('error in add chat: $e');
  }
  return false;
}


}