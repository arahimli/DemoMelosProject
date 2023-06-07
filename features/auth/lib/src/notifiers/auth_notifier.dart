import 'dart:async';

import 'package:auth_middleware/auth_middleware.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

import '../domain/use_cases/is_authenticated.dart';
import '../domain/use_cases/log_out.dart';

enum AuthState { initial, authenticated, unAuthenticated }

class AuthNotifier extends ChangeNotifier {
  AuthNotifier({
    required this.isAuthenticated,
    required this.logOut,
  }) {
    _subscription = sessionExpired.listen(
      (isExpired) {
        if (isExpired) {
          logOutUser();
        }
      },
    );
  }

  AuthState authState = AuthState.initial;
  final IsAuthenticated isAuthenticated;
  final LogOut logOut;
  late final StreamSubscription _subscription;

  Future<AuthState> checkAuth() async {
    final result = await isAuthenticated(NoParams());

    if (result.isSuccess()) {
      final isAuthenticated = result.getSuccess()!;
      authState =
          isAuthenticated ? AuthState.authenticated : AuthState.unAuthenticated;
    } else {
      authState = AuthState.unAuthenticated;
    }

    notifyListeners();
    return authState;
  }

  void loggedIn() {
    authState = AuthState.authenticated;
    notifyListeners();
  }

  void logOutUser() async {
    await logOut(NoParams());
    authState = AuthState.unAuthenticated;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
