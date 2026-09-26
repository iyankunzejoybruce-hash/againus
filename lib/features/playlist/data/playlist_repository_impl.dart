import '../domain/entities/song.dart';
import '../domain/repositories/playlist_repository.dart';

/// Implémentation simple en mémoire.
/// À remplacer par une persistance locale (Hive/SQLite) référençant
/// les chemins de fichiers audio stockés sur l'appareil.
class PlaylistRepositoryImpl implements PlaylistRepository {
  final List<Song> _songs = [];

  @override
  Future<List<Song>> getSongs() async => List.unmodifiable(_songs);

  @override
  Future<void> addSong(Song song) async {
    _songs.add(song);
  }

  @override
  Future<void> removeSong(String songId) async {
    _songs.removeWhere((s) => s.id == songId);
  }

  @override
  Future<void> reorderSongs(List<Song> newOrder) async {
    _songs
      ..clear()
      ..addAll(newOrder);
  }
}
