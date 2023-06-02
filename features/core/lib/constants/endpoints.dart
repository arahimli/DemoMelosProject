import 'environments.dart';

class Endpoint {
  const Endpoint({
    required this.path,
    required this.port,
    this.prodPath,
  });

  final String path;
  final String? prodPath;
  final String port;
}

abstract class Ports {
  static const String p8810 = '8810';
}

abstract class Endpoints {
  static const String devBaseUrl = 'https://dev.example.com/api';
  static const String prodBaseUrl = 'https://prod.example.com/api';

  /// it should be set to work properly
  static Environment environment = Environment.development;

  static final excludeEndpoints = <String>[
    EndpointExt.path(Endpoints.signIn),
  ];

  static const _v1 = '/v1';

  static String get baseUrl {
    switch (environment) {
      case Environment.development:
        return devBaseUrl;
      case Environment.production:
        return prodBaseUrl;
      case Environment.qa:
        return devBaseUrl;
      case Environment.staging:
        return prodBaseUrl;
    }
  }

  static const signIn = Endpoint(
    path: '$_v1/auth/sign-in',
    prodPath: '/authservice/auth/sign-in',
    port: Ports.p8810,
  );

  static const refresh = Endpoint(
    path: '$_v1/auth/refresh',
    prodPath: '/authservice/auth/refresh',
    port: Ports.p8810,
  );

  static const verify = Endpoint(
    path: '$_v1/auth/verify',
    prodPath: '/authservice/auth/verify',
    port: Ports.p8810,
  );

}

extension EndpointExt on Endpoints {
  static String path(Endpoint endpoint) {
    switch (Endpoints.environment) {
      case Environment.development:
        return ':${endpoint.port}${endpoint.path}';
      case Environment.qa:
        return ':${endpoint.port}${endpoint.path}';
      case Environment.production:
        return endpoint.prodPath ?? endpoint.path;
      case Environment.staging:
        return endpoint.prodPath ?? endpoint.path;
    }
  }
}
