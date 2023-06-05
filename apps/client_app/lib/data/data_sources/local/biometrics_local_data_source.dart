import 'package:local_auth/local_auth.dart';

abstract class BiometricsLocalDataSource {
  Future<bool> isBiometricsSupported();

  Future<bool> authenticate();

  Future<List<BiometricType>> getAvailableBiometrics();
}

class BiometricsLocalDataSourceImpl implements BiometricsLocalDataSource {
  const BiometricsLocalDataSourceImpl(this.localAuth);

  final LocalAuthentication localAuth;

  @override
  Future<bool> isBiometricsSupported() async {
    final bool canAuthenticateWithBiometrics =
        await localAuth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await localAuth.isDeviceSupported();

    return canAuthenticate;
  }

  @override
  Future<bool> authenticate() {
    return localAuth.authenticate(
      localizedReason: 'To continue, you must complete the biometrics',
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        biometricOnly: true,
      ),
    );
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() {
    return localAuth.getAvailableBiometrics();
  }
}
