import '../entities/user_profile.dart';
import '../entities/couple_info.dart';

/// Contrat d'accès aux données de paramétrage.
/// L'implémentation concrète (data/repositories) gère le stockage
/// local (Hive, SharedPreferences, SQLite...) puisque l'app est 100% offline.
abstract class SettingsRepository {
  Future<CoupleInfo?> getCoupleInfo();
  Future<void> saveCoupleInfo(CoupleInfo info);

  Future<UserProfile?> getProfile(String userId);
  Future<void> saveProfile(UserProfile profile);

  /// Thème choisi : 'light', 'dark' ou 'system'.
  Future<String> getThemeMode();
  Future<void> setThemeMode(String mode);

  /// Verrouillage par code / biométrie de l'application.
  Future<bool> isAppLockEnabled();
  Future<void> setAppLockEnabled(bool enabled);
  Future<void> setAppLockPin(String pin);
  Future<bool> verifyAppLockPin(String pin);
}
