import '../domain/entities/love_note.dart';
import '../domain/repositories/love_notes_repository.dart';

/// Implémentation simple en mémoire.
/// À remplacer par une persistance locale (Hive/SQLite) pour
/// conserver les notes entre les sessions, toujours en local uniquement.
class LoveNotesRepositoryImpl implements LoveNotesRepository {
  final List<LoveNote> _notes = [];

  @override
  Future<List<LoveNote>> getAllNotes() async {
    final sorted = [..._notes]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sorted;
  }

  @override
  Future<void> addNote(LoveNote note) async {
    _notes.add(note);
  }

  @override
  Future<void> markAsRead(String noteId) async {
    final index = _notes.indexWhere((n) => n.id == noteId);
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(isRead: true);
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    _notes.removeWhere((n) => n.id == noteId);
  }
}
