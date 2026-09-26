import 'package:flutter/material.dart';

import '../../../../core/constants/app_routes.dart';

/// Menu listant tous les mini-jeux disponibles pour le couple.
class GamesMenuPage extends StatelessWidget {
  const GamesMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini-Jeux')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _GameCard(
            icon: Icons.question_answer_outlined,
            label: 'Action ou Vérité',
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.truthOrDare),
          ),
          _GameCard(
            icon: Icons.favorite_outline,
            label: 'Attrape les cœurs',
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.catchHearts),
          ),
        ],
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  const _GameCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
