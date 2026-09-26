import 'package:flutter/foundation.dart';

import '../../domain/entities/couple_info.dart';
import '../../domain/repositories/settings_repository.dart';

/// Contrôleur simple basé sur [ChangeNotifier].
/// À brancher avec Provider / Riverpod / ou tout autre gestionnaire d'état
/// utilisé dans le reste du projet.
class SettingsController extends ChangeNotifier {
  SettingsController(this._repository);

  final SettingsRepository _repository;

  CoupleInfo? _coupleInfo;
  String _themeMode = 'system';
  bool _appLockEnabled = false;
  bool _isLoading = false;

  CoupleInfo? get coupleInfo => _coupleInfo;
  String get themeMode => _themeMode;
  bool get appLockEnabled => _appLockEnabled;
  bool get isLoading => _isLoading;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    _coupleInfo = await _repository.getCoupleInfo();
    _themeMode = await _repository.getThemeMode();
    _appLockEnabled = await _repository.isAppLockEnabled();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateCoupleInfo(CoupleInfo info) async {
    await _repository.saveCoupleInfo(info);
    _coupleInfo = info;
    notifyListeners();
  }

  Future<void> updateThemeMode(String mode) async {
    await _repository.setThemeMode(mode);
    _themeMode = mode;
    notifyListeners();
  }

  Future<void> toggleAppLock(bool enabled) async {
    await _repository.setAppLockEnabled(enabled);
    _appLockEnabled = enabled;
    notifyListeners();
  }
}
