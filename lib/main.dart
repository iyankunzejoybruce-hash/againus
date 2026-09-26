import 'package:flutter/material.dart';

import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';

import 'features/settings/presentation/pages/settings_page.dart';
import 'features/settings/presentation/pages/profiles_subpage.dart';
import 'features/settings/presentation/pages/appearance_subpage.dart';
import 'features/settings/presentation/pages/security_subpage.dart';
import 'features/settings/presentation/pages/couple_subpage.dart';

import 'features/love_notes/presentation/pages/love_notes_page.dart';
import 'features/timeline/presentation/pages/timeline_page.dart';

import 'features/mini_games/presentation/pages/games_menu_page.dart';
import 'features/mini_games/presentation/pages/truth_or_dare_page.dart';
import 'features/mini_games/presentation/pages/catch_hearts_game_page.dart';

import 'features/playlist/presentation/pages/playlist_page.dart';
import 'features/surprise/presentation/pages/surprise_page.dart';
import 'features/album/presentation/pages/album_page.dart';
import 'features/chat/presentation/pages/chat_page.dart';

void main() {
  runApp(const AgainUsApp());
}

/// Widget racine de l'application "AgainUs".
/// Application 100% locale : aucune donnée du couple ne quitte l'appareil.
class AgainUsApp extends StatelessWidget {
  const AgainUsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgainUs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),

        AppRoutes.settings: (context) => const SettingsPage(),
        AppRoutes.profiles: (context) => const ProfilesSubpage(),
        AppRoutes.appearance: (context) => const AppearanceSubpage(),
        AppRoutes.security: (context) => const SecuritySubpage(),
        AppRoutes.couple: (context) => const CoupleSubpage(),

        AppRoutes.loveNotes: (context) => const LoveNotesPage(),
        AppRoutes.timeline: (context) => const TimelinePage(),

        AppRoutes.gamesMenu: (context) => const GamesMenuPage(),
        AppRoutes.truthOrDare: (context) => const TruthOrDarePage(),
        AppRoutes.catchHearts: (context) => const CatchHeartsGamePage(),

        AppRoutes.playlist: (context) => const PlaylistPage(),
        AppRoutes.surprise: (context) => const SurprisePage(),
        AppRoutes.album: (context) => const AlbumPage(),
        AppRoutes.chat: (context) => const ChatPage(currentUserId: 'me'),
      },
    );
  }
}

/// Page d'accueil : header "AgainUs" + bannière + cartes de navigation
/// vers chaque section de l'application.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgainUs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.settings),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Notre Espace Privé',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _HomeCard(
                icon: Icons.favorite,
                label: 'Pourquoi je t\'aime',
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.loveNotes),
              ),
              _HomeCard(
                icon: Icons.auto_stories_outlined,
                label: 'Notre Histoire',
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.timeline),
              ),
              _HomeCard(
                icon: Icons.sports_esports_outlined,
                label: 'Mini-Jeu',
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.gamesMenu),
              ),
              _HomeCard(
                icon: Icons.music_note_outlined,
                label: 'Notre Playlist',
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.playlist),
              ),
              _HomeCard(
                icon: Icons.card_giftcard_outlined,
                label: 'Surprise',
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.surprise),
              ),
              _HomeCard(
                icon: Icons.photo_library_outlined,
                label: 'Notre Album',
                onTap: () => Navigator.pushNamed(context, AppRoutes.album),
              ),
              _HomeCard(
                icon: Icons.chat_bubble_outline,
                label: 'Notre Chat',
                onTap: () => Navigator.pushNamed(context, AppRoutes.chat),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
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
            Icon(icon, size: 36),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
