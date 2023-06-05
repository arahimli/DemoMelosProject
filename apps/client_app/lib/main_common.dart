import 'dart:async';

import 'package:core/constants/environments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/app/app_startup_wrapper.dart';
import 'firebase_options.dart';

void mainCommon(Environment environment, List<Override> overrides) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// initializes [Firebase] for application
      await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform,
      );
      await AppStartupWrapper.initialize(environment, overrides);

    },
    (error, stack) async {
      return FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        fatal: true,
      );
    },
  );
}
