import 'package:flutter/material.dart';

import 'app_theme.dart';

class InheritedAppTheme extends InheritedWidget {
  const InheritedAppTheme({
    Key? key,
    required this.appTheme,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final AppTheme appTheme;

  static AppTheme of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<InheritedAppTheme>();
    return widget!.appTheme;
  }

  @override
  bool updateShouldNotify(covariant InheritedAppTheme oldWidget) {
    return appTheme != oldWidget.appTheme;
  }
}
