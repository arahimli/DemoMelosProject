import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/pref_keys.dart';

abstract class AuthLocalDataSource {
  Future<void> persistRefreshToken(String token);
  Future<void> persistAccessToken(String token);
  Future<String?> get refreshToken;
  Future<String?> get accessToken;
  Future<void> clearTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({
    required this.secureStorage,
  });

  final FlutterSecureStorage secureStorage;

  @override
  Future<String?> get accessToken =>
      secureStorage.read(key: PrefKeys.accessToken);

  @override
  Future<void> persistAccessToken(String token) {
    return secureStorage.write(
      key: PrefKeys.accessToken,
      value: token,
    );
  }

  @override
  Future<String?> get refreshToken =>
      secureStorage.read(key: PrefKeys.refreshToken);

  @override
  Future<void> persistRefreshToken(String token) {
    return secureStorage.write(
      key: PrefKeys.refreshToken,
      value: token,
    );
  }

  @override
  Future<void> clearTokens() {
    return Future.wait([
      secureStorage.delete(key: PrefKeys.accessToken),
      secureStorage.delete(key: PrefKeys.refreshToken),
    ]);
  }
}
