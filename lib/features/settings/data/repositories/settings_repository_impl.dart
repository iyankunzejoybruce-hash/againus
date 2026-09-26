import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../domain/entities/couple_info.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/couple_info_model.dart';
import '../models/user_profile_model.dart';

const _kCoupleInfoKey = 'settings.couple_info';
const _kProfilePrefix = 'settings.profile.';
const _kThemeModeKey = 'settings.theme_mode';
const _kAppLockEnabledKey = 'settings.app_lock_enabled';
const _kAppLockPinKey = 'settings.app_lock_pin';

/// Implémentation 100% locale (SharedPreferences) du [SettingsRepository].
/// Aucune donnée ne quitte l'appareil, conformément à l'exigence
/// de confidentialité de l'application AgainUs.
class SettingsRepositoryImpl implements SettingsRepository {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<CoupleInfo?> getCoupleInfo() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_kCoupleInfoKey);
    if (raw == null) return null;
    return CoupleInfoModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveCoupleInfo(CoupleInfo info) async {
    final prefs = await _prefs;
    final model = CoupleInfoModel(
      togetherSince: info.togetherSince,
      partnerA: info.partnerA,
      partnerB: info.partnerB,
      coupleNickname: info.coupleNickname,
    );
    await prefs.setString(_kCoupleInfoKey, jsonEncode(model.toJson()));
  }

  @override
  Future<UserProfile?> getProfile(String userId) async {
    final prefs = await _prefs;
    final raw = prefs.getString('$_kProfilePrefix$userId');
    if (raw == null) return null;
    return UserProfileModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    final prefs = await _prefs;
    final model = UserProfileModel.fromEntity(profile);
    await prefs.setString(
      '$_kProfilePrefix${profile.id}',
      jsonEncode(model.toJson()),
    );
  }

  @override
  Future<String> getThemeMode() async {
    final prefs = await _prefs;
    return prefs.getString(_kThemeModeKey) ?? 'system';
  }

  @override
  Future<void> setThemeMode(String mode) async {
    final prefs = await _prefs;
    await prefs.setString(_kThemeModeKey, mode);
  }

  @override
  Future<bool> isAppLockEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool(_kAppLockEnabledKey) ?? false;
  }

  @override
  Future<void> setAppLockEnabled(bool enabled) async {
    final prefs = await _prefs;
    await prefs.setBool(_kAppLockEnabledKey, enabled);
  }

  @override
  Future<void> setAppLockPin(String pin) async {
    final prefs = await _prefs;
    // NB: à des fins de simplicité ce PoC stocke le code brut ;
    // pour une version de production, hacher le code (ex: crypto/sha256).
    await prefs.setString(_kAppLockPinKey, pin);
  }

  @override
  Future<bool> verifyAppLockPin(String pin) async {
    final prefs = await _prefs;
    final stored = prefs.getString(_kAppLockPinKey);
    return stored != null && stored == pin;
  }
}
