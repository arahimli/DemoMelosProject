abstract class PreferencesKeys {
  static const appOpenedOnce = 'appOpenedOnce';
  static const String onboardingState = 'onboardingState';
  static const String userPin = 'userPin';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String biometricsState = 'biometricsState';
  static const String locale = 'locale';
  static const String recentEmployees = 'recentEmployees';
  static const String email = 'email';
}

enum HttpMethods { get, put, post }

extension HttpMethodsToStringExt on HttpMethods {
  String get stringify {
    switch (this) {
      case HttpMethods.put:
        return 'PUT';
      case HttpMethods.post:
        return 'POST';
      default:
        return 'GET';
    }
  }
}
