import '../entities/song.dart';

/// Contrat d'accès aux chansons de la playlist locale du couple.
/// Les fichiers audio restent sur l'appareil (aucun upload).
abstract class PlaylistRepository {
  Future<List<Song>> getSongs();
  Future<void> addSong(Song song);
  Future<void> removeSong(String songId);
  Future<void> reorderSongs(List<Song> newOrder);
}
