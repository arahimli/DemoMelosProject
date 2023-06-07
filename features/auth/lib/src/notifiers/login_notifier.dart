import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/use_cases/login.dart';

typedef LoginState = DataState<String?, Unit, dynamic>;

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.login) : super(const DataState());

  final Login login;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    state = state.copyWith(isInProgress: true);

    final result = await login(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.when(
      error: (e) {
        state = state.copyWith(
          isFailure: true,
          error: e.error,
        );
      },
      success: (_) {
        state = state.copyWith(isSuccess: true);
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
