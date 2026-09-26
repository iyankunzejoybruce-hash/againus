import '../entities/photo_item.dart';

/// Contrat d'accès aux photos de l'album privé du couple.
/// Les fichiers restent stockés localement sur l'appareil.
abstract class AlbumRepository {
  Future<List<PhotoItem>> getPhotos();
  Future<void> addPhoto(PhotoItem photo);
  Future<void> deletePhoto(String photoId);
}
