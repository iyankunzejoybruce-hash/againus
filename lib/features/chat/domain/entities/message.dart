/// Représente un message échangé dans le chat privé du couple.
/// Le chat étant local, les messages ne sont visibles que sur cet appareil.
class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime sentAt;
  final bool isRead;

  const Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.sentAt,
    this.isRead = false,
  });

  Message copyWith({bool? isRead}) {
    return Message(
      id: id,
      senderId: senderId,
      content: content,
      sentAt: sentAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
