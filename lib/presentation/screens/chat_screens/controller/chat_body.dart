mixin ChatBody{
  static Map<String, dynamic> messageMap(
          {required String text,
          required String chatId,
    required String senderId,
          }) =>
      {
        "text": text,
         "chatId":chatId,
    "senderId":senderId
        
      };

      static Map<String,dynamic> chatMap({
required String senderId,
required String receiverId
      })=>{
        "senderId":senderId,
    "recieverId":receiverId
      };
}