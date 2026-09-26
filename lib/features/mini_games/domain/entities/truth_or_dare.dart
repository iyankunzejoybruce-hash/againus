/// Type de carte : question (vérité) ou défi (action).
enum TruthOrDareType { truth, dare }

/// Une carte du jeu "Action ou Vérité".
class TruthOrDareCard {
  final String id;
  final TruthOrDareType type;
  final String content;
  final bool isSpicy;

  const TruthOrDareCard({
    required this.id,
    required this.type,
    required this.content,
    this.isSpicy = false,
  });
}
