import 'package:core/constants/environments.dart';

extension EnvToNameExt on Environment {
  String get convertPrefix {
    switch (this) {
      case Environment.development:
        return '[DEV] ';
      case Environment.qa:
        return '[QA] ';
      case Environment.production:
        return '';
      default:
        return 'Unknown';
    }
  }
}
