import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/keys.dart';

abstract class PreferencesLocalDataSource {
  Future<bool> setAppAtLeastOpenedOnce();
  bool? get isAppOpenedBefore;

  Future<bool> setOnboardingViewed();
  bool? get isOnboardingViewed;

  Future<void> persistPin(String pin);
  Future<bool>? get isPinEnabled;
  Future<void> clearPin();
  Future<String?> get pin;

  Future<void> setBiometricsStatus(bool enabled);
  bool? get isBiometricsEnabled;

  Future<void> clearAllPreferences([bool skipOnboarding = false]);

  Future<void> persistUserEmail(String email);
  String get email;
}

class PreferencesLocalDataSourceImpl implements PreferencesLocalDataSource {
  const PreferencesLocalDataSourceImpl({
    required this.localAuth,
    required this.secureStorage,
    required this.sharedPreferences,
  });

  final LocalAuthentication localAuth;
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  @override
  Future<bool> setAppAtLeastOpenedOnce() {
    return sharedPreferences.setBool(
      PreferencesKeys.appOpenedOnce,
      true,
    );
  }

  @override
  bool? get isAppOpenedBefore =>
      sharedPreferences.getBool(PreferencesKeys.appOpenedOnce);

  @override
  Future<bool> setOnboardingViewed() {
    return sharedPreferences.setBool(
      PreferencesKeys.onboardingState,
      true,
    );
  }

  @override
  bool? get isOnboardingViewed =>
      sharedPreferences.getBool(PreferencesKeys.onboardingState);

  @override
  Future<void> persistPin(String pin) =>
      secureStorage.write(key: PreferencesKeys.userPin, value: pin);

  @override
  Future<bool>? get isPinEnabled async {
    final pin = await secureStorage.read(key: PreferencesKeys.userPin);
    return pin != null;
  }

  @override
  Future<void> clearPin() => secureStorage.delete(key: PreferencesKeys.userPin);

  @override
  Future<String?> get pin => secureStorage.read(key: PreferencesKeys.userPin);

  @override
  Future<void> clearAllPreferences([bool skipOnboarding = false]) async {
    await sharedPreferences.remove(PreferencesKeys.biometricsState);
    await sharedPreferences.remove(PreferencesKeys.recentEmployees);
    await secureStorage.delete(key: PreferencesKeys.userPin);
    await sharedPreferences.remove(PreferencesKeys.email);

    if (!skipOnboarding) {
      await sharedPreferences.remove(PreferencesKeys.onboardingState);
    }
  }

  @override
  Future<void> setBiometricsStatus(bool enabled) {
    return sharedPreferences.setBool(
      PreferencesKeys.biometricsState,
      enabled,
    );
  }

  @override
  bool? get isBiometricsEnabled {
    return sharedPreferences.getBool(PreferencesKeys.biometricsState);
  }

  @override
  Future<void> persistUserEmail(String email) {
    return sharedPreferences.setString(
      PreferencesKeys.email,
      email,
    );
  }

  @override
  String get email => sharedPreferences.getString(PreferencesKeys.email)!;
}
