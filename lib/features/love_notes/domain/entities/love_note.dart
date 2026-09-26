/// Représente un petit mot doux laissé par l'un des partenaires.
class LoveNote {
  final String id;
  final String authorId;
  final String content;
  final DateTime createdAt;
  final bool isRead;
  final String? emoji;

  const LoveNote({
    required this.id,
    required this.authorId,
    required this.content,
    required this.createdAt,
    this.isRead = false,
    this.emoji,
  });

  LoveNote copyWith({bool? isRead}) {
    return LoveNote(
      id: id,
      authorId: authorId,
      content: content,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
      emoji: emoji,
    );
  }
}
