import '../entities/message.dart';

/// Contrat d'accès aux messages du chat privé local du couple.
abstract class ChatRepository {
  Future<List<Message>> getMessages();
  Future<void> sendMessage(Message message);
  Future<void> markAllAsRead(String currentUserId);
}
