import 'dart:math';

import 'package:flutter/material.dart';

/// Page "Surprise" : révèle un message ou une attention surprise
/// après une petite animation, pour un effet ludique.
class SurprisePage extends StatefulWidget {
  const SurprisePage({super.key, this.surprises = const []});

  final List<String> surprises;

  @override
  State<SurprisePage> createState() => _SurprisePageState();
}

class _SurprisePageState extends State<SurprisePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  String? _revealed;

  void _reveal() {
    final defaults = widget.surprises.isNotEmpty
        ? widget.surprises
        : const ["Je pense à toi en ce moment même 💖"];
    final random = Random();
    setState(() {
      _revealed = defaults[random.nextInt(defaults.length)];
    });
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Surprise')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_revealed != null)
                ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _controller,
                    curve: Curves.elasticOut,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        _revealed!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: _reveal,
                icon: const Icon(Icons.card_giftcard_outlined),
                label: const Text('Découvrir ma surprise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
