/// Centralise tous les noms de routes de l'application.
/// Utilisé avec Navigator.pushNamed ou go_router selon le choix du projet.
class AppRoutes {
  AppRoutes._();

  static const String home = '/';

  // Settings
  static const String settings = '/settings';
  static const String profiles = '/settings/profiles';
  static const String appearance = '/settings/appearance';
  static const String security = '/settings/security';
  static const String couple = '/settings/couple';

  // Love notes
  static const String loveNotes = '/love-notes';

  // Timeline
  static const String timeline = '/timeline';

  // Mini jeux
  static const String gamesMenu = '/games';
  static const String truthOrDare = '/games/truth-or-dare';
  static const String catchHearts = '/games/catch-hearts';

  // Playlist
  static const String playlist = '/playlist';

  // Surprise
  static const String surprise = '/surprise';

  // Album
  static const String album = '/album';

  // Chat
  static const String chat = '/chat';
}
