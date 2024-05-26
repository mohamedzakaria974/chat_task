enum MessageType { sent, received }

class Message {
  String message;
  MessageType messageType;

  Message({required this.message, required this.messageType});
}
