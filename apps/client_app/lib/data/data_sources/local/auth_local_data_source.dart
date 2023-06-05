import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../constants/keys.dart';

abstract class AuthLocalDataSource {
  Future<void> persistRefreshToken(String token);

  Future<void> persistAccessToken(String token);

  Future<String?> get refreshToken;

  Future<String?> get accessToken;

  Future<void> clearTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({
    required this.localAuth,
    required this.secureStorage,
  });

  final LocalAuthentication localAuth;
  final FlutterSecureStorage secureStorage;

  @override
  Future<String?> get accessToken =>
      secureStorage.read(key: PreferencesKeys.accessToken);

  @override
  Future<void> persistAccessToken(String token) {
    return secureStorage.write(
      key: PreferencesKeys.accessToken,
      value: token,
    );
  }

  @override
  Future<String?> get refreshToken =>
      secureStorage.read(key: PreferencesKeys.refreshToken);

  @override
  Future<void> persistRefreshToken(String token) {
    return secureStorage.write(
      key: PreferencesKeys.refreshToken,
      value: token,
    );
  }

  @override
  Future<void> clearTokens() {
    return Future.wait([
      secureStorage.delete(key: PreferencesKeys.accessToken),
      secureStorage.delete(key: PreferencesKeys.refreshToken),
    ]);
  }
}
