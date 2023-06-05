
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import 'data_sources.dart';


final localizationNotifierProvider =
StateNotifierProvider<LocalizationNotifier, Locale>(
      (ref) {
    return LocalizationNotifier(
      localizationDataSource: ref.watch(localizationDataSourceProvider),
    );
  },
);
