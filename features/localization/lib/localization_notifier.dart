import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'localization_data_source.dart';

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier({
    required this.localizationDataSource,
  })  : _selectedLanguageCode = 'en',
        super(const Locale('en')) {
    try {
      final languageCode = localizationDataSource.locale;

      if (languageCode != null) {
        _selectedLanguageCode = languageCode;
        Intl.defaultLocale = _selectedLanguageCode;
        state = Locale(languageCode);
      }
    } catch (_) {}
  }

  final LocalizationDataSource localizationDataSource;
  String _selectedLanguageCode;

  void changeLanguage(String languageCode) {
    _selectedLanguageCode = languageCode;
  }

  void resetSelection() {
    _selectedLanguageCode = state.languageCode;
  }

  String get selectedLanguageCode => _selectedLanguageCode;

  void apply() async {
    if (state == Locale(_selectedLanguageCode)) return;

    try {
      await localizationDataSource.persistLocale(_selectedLanguageCode);
      Intl.defaultLocale = _selectedLanguageCode;
      state = Locale(_selectedLanguageCode);
    } catch (_) {}
  }
}
