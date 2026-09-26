import 'package:flutter/material.dart';

import '../../data/truth_or_dare_cards.dart';
import '../../domain/entities/truth_or_dare.dart';

/// Page de jeu "Action ou Vérité" : pioche une carte au hasard
/// et l'affiche à l'écran.
class TruthOrDarePage extends StatefulWidget {
  const TruthOrDarePage({super.key});

  @override
  State<TruthOrDarePage> createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage> {
  TruthOrDareCard? _current;

  void _drawCard(TruthOrDareType? filter) {
    final deck = TruthOrDareCards.defaultDeck
        .where((c) => filter == null || c.type == filter)
        .toList();
    deck.shuffle();
    setState(() => _current = deck.isNotEmpty ? deck.first : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Action ou Vérité')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_current != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          _current!.type == TruthOrDareType.truth
                              ? 'VÉRITÉ'
                              : 'ACTION',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _current!.content,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              else
                const Text('Choisis une catégorie pour commencer'),
              const SizedBox(height: 32),
              Wrap(
                spacing: 12,
                children: [
                  FilledButton(
                    onPressed: () => _drawCard(TruthOrDareType.truth),
                    child: const Text('Vérité'),
                  ),
                  FilledButton(
                    onPressed: () => _drawCard(TruthOrDareType.dare),
                    child: const Text('Action'),
                  ),
                  OutlinedButton(
                    onPressed: () => _drawCard(null),
                    child: const Text('Surprise'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
