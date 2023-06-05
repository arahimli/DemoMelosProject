import 'package:core/constants/environments.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection/externals.dart';
import 'app.dart';

final initialLinkNotifier = ValueNotifier<String?>(null);

abstract class AppStartupWrapper {
  static Future<void> initialize(
      Environment environment,
      List<Override> overrides,
      ) async {

    EquatableConfig.stringify = true;

    /// enables [FirebaseCrashlytics] for application
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    /// enables portrait mode for application (disable landscape mode)
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /// enables [FirebaseCrashlytics] for application
    /// if [environment] is [Environment.production]
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      environment == Environment.production,
    );

    /// initializes [SharedPreferences] for application
    final sharedPreferences = await SharedPreferences.getInstance();

    /// initializes [FirebaseRemoteConfig] for application
    final container = ProviderContainer(
      overrides: [
        ...overrides,
        sharedPrefsProvider.overrideWithValue(sharedPreferences),
      ],
    );

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: App(environment: environment),
      ),
    );
  }
}
