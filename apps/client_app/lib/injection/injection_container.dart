import 'package:core/constants/environments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routing/app_router.dart';
import 'externals.dart';

final environmentProvider = Provider<Environment>((ref) {
  throw UnimplementedError();
});

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(
    analytics: ref.watch(firebaseAnalyticsProvider),
  );
});
