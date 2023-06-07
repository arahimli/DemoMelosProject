import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
// import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_interceptor.dart';
import 'data_sources.dart';
import 'injection_container.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final localAuthProvider = Provider<LocalAuthentication>((ref) {
  return LocalAuthentication();
});

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});


final dioProvider = Provider<Dio>(
  (ref) {
    final environment = ref.watch(environmentProvider);
    Endpoints.environment = environment;

    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: environment == Environment.development
            ? Endpoints.devBaseUrl
            : Endpoints.prodBaseUrl,
        // connectTimeout: 60000,
        // receiveTimeout: 60000,
        responseType: ResponseType.json,
        contentType: 'application/json',
      );

    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.findProxy = (url) => 'PROXY 192.168.167.168:8080';
    //   return client;
    // };

    final authInterceptor = AppInterceptor(
      authLocalDataSource: ref.watch(
        authLocalDataSourceProvider,
      ),
      localizationDataSource: ref.watch(
        localizationDataSourceProvider,
      ),
      dio: dio,
      environment: ref.watch(environmentProvider),
    );

    dio.interceptors.addAll(
      [
        // CertificatePinningInterceptor(
        //   allowedSHAFingerprints: [
        //     InsideEnv.insideSSLFingerprint,
        //     InsideEnv.infosecSSLFingerprint,
        //   ],
        // ),
        if (environment != Environment.production)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            request: true,
          ),
        authInterceptor,
      ],
    );

    return dio;
  },
);

void initAdapter() {}

final firebaseDynamicLinksProvider = Provider<FirebaseDynamicLinks>((ref) {
  return FirebaseDynamicLinks.instance;
});

final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>((ref) {
  return FirebaseAnalytics.instance;
});
