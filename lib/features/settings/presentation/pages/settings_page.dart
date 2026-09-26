import 'package:flutter/material.dart';

import '../../../../core/constants/app_routes.dart';

/// Page d'entrée des paramètres : liste vers les sous-pages
/// (profils, apparence, sécurité, couple).
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _SettingsTile(
            icon: Icons.people_outline,
            title: 'Profils',
            subtitle: 'Vos informations personnelles',
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.profiles),
          ),
          _SettingsTile(
            icon: Icons.palette_outlined,
            title: 'Apparence',
            subtitle: 'Thème clair, sombre ou automatique',
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.appearance),
          ),
          _SettingsTile(
            icon: Icons.lock_outline,
            title: 'Sécurité',
            subtitle: 'Verrouillage et confidentialité',
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.security),
          ),
          _SettingsTile(
            icon: Icons.favorite_outline,
            title: 'Notre Couple',
            subtitle: 'Date, surnoms et informations du couple',
            onTap: () => Navigator.pushNamed(context, AppRoutes.couple),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
