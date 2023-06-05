


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import '../data/data_sources/local/auth_local_data_source.dart';
import 'externals.dart';

final localizationDataSourceProvider = Provider<LocalizationDataSource>(
      (ref) {
    return LocalizationDataSourceImpl(
      ref.watch(sharedPrefsProvider),
    );
  },
);

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl(
    localAuth: ref.watch(localAuthProvider),
    secureStorage: ref.watch(secureStorageProvider),
  );
});
