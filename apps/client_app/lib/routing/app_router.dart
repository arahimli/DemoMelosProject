
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/main/presentation/pages/main_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  /// Constructor for a page with no transition functionality.
  const FadeTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: const Duration(microseconds: 1),
        );

  static Widget _transitionsBuilder(
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );
}

class AppRouter {
  AppRouter({
    required this.analytics,
  });

  GoRouter get router => _router;
  final FirebaseAnalytics analytics;
  final navigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    redirect: (context, state) {
      return state.location;
    },
    observers: [
      FirebaseAnalyticsObserver(
        analytics: analytics,
      ),
    ],
    routes: [
      GoRoute(
        parentNavigatorKey: navigatorKey,
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: navigatorKey,
        path: AppRoutes.threatDetected,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Vulnerability found!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
      // ShellRoute(
      //   builder: (context, state, child) {
      //     return MainPage(child: child);
      //   },
      //   routes: [
      //
      //   ],
      // ),
    ],
  );
}
