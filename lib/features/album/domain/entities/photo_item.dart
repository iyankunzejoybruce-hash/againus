/// Représente une photo enregistrée dans "Notre Album".
class PhotoItem {
  final String id;
  final String filePath;
  final String? caption;
  final DateTime addedAt;

  const PhotoItem({
    required this.id,
    required this.filePath,
    required this.addedAt,
    this.caption,
  });
}
