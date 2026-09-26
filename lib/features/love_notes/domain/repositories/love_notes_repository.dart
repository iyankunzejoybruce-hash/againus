import '../entities/love_note.dart';

/// Contrat d'accès aux "mots doux" échangés dans le couple.
abstract class LoveNotesRepository {
  Future<List<LoveNote>> getAllNotes();
  Future<void> addNote(LoveNote note);
  Future<void> markAsRead(String noteId);
  Future<void> deleteNote(String noteId);
}
