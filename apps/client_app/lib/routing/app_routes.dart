abstract class SubRoutes {
  /// checked
  static const createPin = 'create-pin';
  static const setBiometrics = 'set-biometrics';
  static const changePin = 'changePin';
  static const create = 'create';
  static const edit = 'edit';
  static const vacancyDetails = 'vacancyDetails';
  static const policyDetails = 'details';
}

abstract class AppRoutes {
  /// checked
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const terms = '/terms';
  static const createPin = '$login/create-pin';
  static const setBiometrics = '$createPin/set-biometrics';
  static const relogin = '/relogin';
  static const success = '/success';
  static const failure = '/failure';
  static const changePinSuccess = '$success/${SubRoutes.changePin}';
  static const changePinFailure = '$failure/${SubRoutes.changePin}';
  static const threatDetected = '/threatDetected';
}
