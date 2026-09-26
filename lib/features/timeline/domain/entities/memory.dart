/// Représente un souvenir daté dans "Notre Histoire" (timeline du couple).
class Memory {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final List<String> photoPaths;

  const Memory({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.photoPaths = const [],
  });
}
