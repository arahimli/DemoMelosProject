import 'package:shared_preferences/shared_preferences.dart';

String _kLocale = 'locale';

abstract class LocalizationDataSource {
  String? get locale;
  Future<void> persistLocale(String langaugeCode);
}

class LocalizationDataSourceImpl implements LocalizationDataSource {
  const LocalizationDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  String? get locale => sharedPreferences.getString(_kLocale);

  @override
  Future<void> persistLocale(String langaugeCode) {
    return sharedPreferences.setString(_kLocale, langaugeCode);
  }
}
