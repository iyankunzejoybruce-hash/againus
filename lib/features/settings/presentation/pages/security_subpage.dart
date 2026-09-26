import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SecuritySubpage extends StatelessWidget {
  const SecuritySubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sécurité', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.primary),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mot de passe Surprise', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Changez le code secret pour accéder à la surprise', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: TextEditingController(text: '2026'),
                  decoration: InputDecoration(
                    labelText: 'NOUVEAU MOT DE PASSE',
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    children: [
                      Icon(Icons.lock, size: 16, color: AppColors.primary),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text('Partagez ce code uniquement avec votre partenaire', style: TextStyle(color: AppColors.primary, fontSize: 11)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}