import '../domain/entities/message.dart';
import '../domain/repositories/chat_repository.dart';

/// Implémentation simple en mémoire.
/// À remplacer par une persistance locale (Hive/SQLite) puisque
/// ce chat ne transite jamais par un serveur distant.
class ChatRepositoryImpl implements ChatRepository {
  final List<Message> _messages = [];

  @override
  Future<List<Message>> getMessages() async {
    final sorted = [..._messages]..sort((a, b) => a.sentAt.compareTo(b.sentAt));
    return sorted;
  }

  @override
  Future<void> sendMessage(Message message) async {
    _messages.add(message);
  }

  @override
  Future<void> markAllAsRead(String currentUserId) async {
    for (var i = 0; i < _messages.length; i++) {
      if (_messages[i].senderId != currentUserId) {
        _messages[i] = _messages[i].copyWith(isRead: true);
      }
    }
  }
}
