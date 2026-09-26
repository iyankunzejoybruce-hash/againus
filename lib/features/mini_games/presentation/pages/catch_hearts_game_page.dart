import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// Mini-jeu léger : des cœurs tombent, l'utilisateur doit les toucher
/// avant qu'ils n'atteignent le bas de l'écran.
class CatchHeartsGamePage extends StatefulWidget {
  const CatchHeartsGamePage({super.key});

  @override
  State<CatchHeartsGamePage> createState() => _CatchHeartsGamePageState();
}

class _Heart {
  double x;
  double y;
  _Heart(this.x, this.y);
}

class _CatchHeartsGamePageState extends State<CatchHeartsGamePage> {
  final List<_Heart> _hearts = [];
  final Random _random = Random();
  Timer? _ticker;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(() {
        _hearts.add(_Heart(_random.nextDouble(), 0));
        for (final h in _hearts) {
          h.y += 0.05;
        }
        _hearts.removeWhere((h) => h.y > 1.0);
      });
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  void _catchHeart(_Heart heart) {
    setState(() {
      _hearts.remove(heart);
      _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attrape les cœurs'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text('Score: $_score')),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: _hearts.map((heart) {
              return Positioned(
                left: heart.x * (constraints.maxWidth - 40),
                top: heart.y * (constraints.maxHeight - 40),
                child: GestureDetector(
                  onTap: () => _catchHeart(heart),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.pinkAccent,
                    size: 36,
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
