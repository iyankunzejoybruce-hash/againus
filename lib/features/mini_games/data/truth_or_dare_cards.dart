import '../domain/entities/truth_or_dare.dart';

/// Jeu de cartes par défaut, 100% local, pour le mini-jeu
/// "Action ou Vérité". À enrichir/éditer librement.
class TruthOrDareCards {
  TruthOrDareCards._();

  static const List<TruthOrDareCard> defaultDeck = [
    TruthOrDareCard(
      id: 't1',
      type: TruthOrDareType.truth,
      content: "Quel a été ton premier souvenir marquant avec moi ?",
    ),
    TruthOrDareCard(
      id: 't2',
      type: TruthOrDareType.truth,
      content: "Qu'est-ce que tu préfères le plus chez moi ?",
    ),
    TruthOrDareCard(
      id: 'd1',
      type: TruthOrDareType.dare,
      content: "Envoie-moi un compliment maintenant.",
    ),
    TruthOrDareCard(
      id: 'd2',
      type: TruthOrDareType.dare,
      content: "Fais-moi un câlin de 30 secondes.",
    ),
  ];
}
