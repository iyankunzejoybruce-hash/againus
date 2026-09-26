import '../domain/entities/photo_item.dart';
import '../domain/repositories/album_repository.dart';

/// Implémentation simple en mémoire.
/// À remplacer par une persistance locale (Hive/SQLite) référençant
/// les chemins de fichiers images stockés sur l'appareil.
class AlbumRepositoryImpl implements AlbumRepository {
  final List<PhotoItem> _photos = [];

  @override
  Future<List<PhotoItem>> getPhotos() async {
    final sorted = [..._photos]
      ..sort((a, b) => b.addedAt.compareTo(a.addedAt));
    return sorted;
  }

  @override
  Future<void> addPhoto(PhotoItem photo) async {
    _photos.add(photo);
  }

  @override
  Future<void> deletePhoto(String photoId) async {
    _photos.removeWhere((p) => p.id == photoId);
  }
}
