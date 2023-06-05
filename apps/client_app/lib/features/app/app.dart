import 'package:app_theme/app_theme.dart';
import 'package:client_app/utils/env_to_name_ext.dart';
import 'package:core/constants/environments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/themes.dart';
import '../../injection/blocs.dart';
import '../../injection/injection_container.dart';

class PageWrapper extends ConsumerWidget {
  const PageWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaData = MediaQuery.of(context);

    return MediaQuery(
      data: mediaData.copyWith(
        textScaleFactor: mediaData.textScaleFactor.clamp(1.0, 1.3),
      ),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: child,
      ),
    );
  }
}

class App extends ConsumerWidget {
  const App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  final Environment environment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider).router;
    // final isAppSecure = ref.watch(inAppProtectionServiceProvider);

    // ref.listen<AuthState>(
    //   authFlowNotifierProvider,
    //   (previous, next) {
    //     final authStatus = next.authStatus;
    //
    //     if (authStatus == AuthStatus.unAuthenticated) {
    //       ref.read(appFlowFacadeProvider.notifier).reset();
    //       appRouter.go(AppRoutes.login);
    //     }
    //     if (authStatus == AuthStatus.guest) {
    //       appRouter.go(AppRoutes.home);
    //     }
    //   },
    // );

    // if (!isAppSecure) {
    //   return const MaterialApp(
    //     home: Scaffold(
    //       body: Center(
    //         child: Text(
    //           'Threat detected!',
    //           style: TextStyle(
    //             fontSize: 20,
    //             color: Colors.red,
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }



    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init(constraints, orientation);

            return InheritedAppTheme(
              appTheme: AppTheme(
                colors: AppColorsData.light(),
                typography: WebTypographyData.regular(),
              ),
              child: Builder(
                builder: (BuildContext context) {
                  final AppTheme appTheme = InheritedAppTheme.of(context);

                  return MaterialApp.router(
                    key: key,
                    title: '${environment.convertPrefix}Client app',
                    debugShowCheckedModeBanner: false,
                    locale: Locale(
                      ref.watch(localizationNotifierProvider).languageCode,
                    ),
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    routerDelegate: appRouter.routerDelegate,
                    routeInformationParser: appRouter.routeInformationParser,
                    routeInformationProvider:
                        appRouter.routeInformationProvider,
                    theme: ThemeData(
                      useMaterial3: true,
                      colorScheme: lightColorScheme(appTheme),
                      scaffoldBackgroundColor: appTheme.colors.background,
                      fontFamily: 'SFProDisplay',
                    ),
                    builder: (context, child) {
                      return PageWrapper(child: child!);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
