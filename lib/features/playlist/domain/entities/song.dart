/// Représente une chanson "notre chanson" ajoutée à la playlist du couple.
class Song {
  final String id;
  final String title;
  final String artist;
  final String localFilePath;
  final String? coverImagePath;
  final Duration duration;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.localFilePath,
    required this.duration,
    this.coverImagePath,
  });
}
