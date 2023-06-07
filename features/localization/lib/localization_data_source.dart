import 'package:shared_preferences/shared_preferences.dart';

String _kLocale = 'locale';

abstract class LocalizationDataSource {
  String? get locale;
  Future<void> persistLocale(String languageCode);
}

class LocalizationDataSourceImpl implements LocalizationDataSource {
  const LocalizationDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  String? get locale => sharedPreferences.getString(_kLocale);

  @override
  Future<void> persistLocale(String languageCode) {
    return sharedPreferences.setString(_kLocale, languageCode);
  }
}
