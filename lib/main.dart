import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/pages/settings_page.dart';
import 'features/love_notes/presentation/pages/love_notes_page.dart';
import 'features/timeline/presentation/pages/timeline_page.dart';
import 'features/mini_games/presentation/pages/games_menu_page.dart';
import 'features/playlist/presentation/pages/playlist_page.dart';
import 'features/surprise/presentation/pages/surprise_page.dart';
import 'features/album/presentation/pages/album_page.dart';
import 'features/chat/presentation/pages/chat_page.dart';

void main() {
  runApp(const AgainUsApp());
}

class AgainUsApp extends StatelessWidget {
  const AgainUsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgainUs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.settings: (context) => const SettingsPage(),
        AppRoutes.loveNotes: (context) => LoveNotesPage(),
        AppRoutes.timeline: (context) => const TimelinePage(),
        AppRoutes.gamesMenu: (context) => const GamesMenuPage(),
        AppRoutes.playlist: (context) => PlaylistPage(),
        AppRoutes.surprise: (context) => const SurprisePage(),
        AppRoutes.album: (context) => AlbumPage(),
        AppRoutes.chat: (context) => const ChatPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('AgainUs', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary)),
            Text('NOTRE ESPACE À NOUS DEUX', style: TextStyle(fontSize: 10, letterSpacing: 1.2, color: AppColors.textMuted)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.primary),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Section Avatars & Coeur
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e'),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.primary,
                          child: const Icon(Icons.add, size: 14, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text('LUI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textDark)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('💕', style: TextStyle(fontSize: 28)),
                ),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330'),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.primary,
                          child: const Icon(Icons.add, size: 14, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text('ELLE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textDark)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Encadré Message du jour
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: const Column(
                children: [
                  Text('✨ notre espace privé ✨', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                  SizedBox(height: 6),
                  Text('Ajouter un message du jour', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('MENU', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textMuted, letterSpacing: 1)),
            ),

            const SizedBox(height: 10),

            // Cartes du Menu Principal
            _buildMenuItem(context, 'Pourquoi je t\'aime', 'Des raisons qui viennent du cœur', Icons.favorite, AppRoutes.loveNotes),
            _buildMenuItem(context, 'Notre Histoire', 'La timeline de notre amour', Icons.timeline, AppRoutes.timeline),
            _buildMenuItem(context, 'Mini Jeux', 'Action ou Vérité - Attrape les cœurs', Icons.sports_esports, AppRoutes.gamesMenu),
            _buildMenuItem(context, 'Notre Playlist', 'Les chansons de notre histoire', Icons.music_note, AppRoutes.playlist),
            _buildMenuItem(context, 'Surprise', 'Un secret pour toi seul(e)', Icons.card_giftcard, AppRoutes.surprise),
            _buildMenuItem(context, 'Notre Album', 'Nos plus beaux souvenirs', Icons.photo_library, AppRoutes.album),
            _buildMenuItem(context, 'Conversation', 'Notre fil de messages privés', Icons.chat_bubble_outline, AppRoutes.chat),

            const SizedBox(height: 16),
            const Text('💕 Ensemble depuis le 14 février 2024', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String subtitle, IconData icon, String route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 24),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textDark)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textMuted),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}