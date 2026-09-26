import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Petit wrapper autour de image_picker pour uniformiser la sélection
/// d'images dans toute l'application (photo de profil, album, etc.)
/// Nécessite le package `image_picker` dans pubspec.yaml.
class ImagePickerHelper {
  ImagePickerHelper._();

  static final ImagePicker _picker = ImagePicker();

  /// Ouvre la galerie et retourne un [File] ou null si annulé.
  static Future<File?> pickFromGallery({int imageQuality = 85}) async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    );
    if (picked == null) return null;
    return File(picked.path);
  }

  /// Ouvre la caméra et retourne un [File] ou null si annulé.
  static Future<File?> pickFromCamera({int imageQuality = 85}) async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: imageQuality,
    );
    if (picked == null) return null;
    return File(picked.path);
  }

  /// Sélection multiple, utile pour l'album photo du couple.
  static Future<List<File>> pickMultipleFromGallery({
    int imageQuality = 85,
  }) async {
    final List<XFile> picked = await _picker.pickMultiImage(
      imageQuality: imageQuality,
    );
    return picked.map((x) => File(x.path)).toList();
  }
}
