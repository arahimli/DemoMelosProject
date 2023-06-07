// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:core/core.dart';
import 'package:core/error/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:localization/localization_data_source.dart';
import 'package:rxdart/rxdart.dart';

import '../data/data_sources/local/auth_local_data_source.dart';

final sessionExpired = BehaviorSubject<bool>();

class AppInterceptor extends Interceptor {
  AppInterceptor({
    required this.authLocalDataSource,
    required this.localizationDataSource,
    required this.dio,
    required this.environment,
  });

  final AuthLocalDataSource authLocalDataSource;
  final LocalizationDataSource localizationDataSource;
  final Dio dio;
  final Environment environment;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final currentLocale = localizationDataSource.locale ?? 'en';
    options.headers['Accept-Language'] = currentLocale;

    if (!Endpoints.excludeEndpoints.contains(options.path)) {
      final token = await authLocalDataSource.accessToken;

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final isExpiredError =
        err.response != null && err.response!.statusCode == 401;

    /// if endpoint is not /refresh and response is 401
    /// then we refresh [accessToken] and call the same
    /// request again
    if (isExpiredError) {
      final result = await _refreshToken();

      if (result) {
        return handler.resolve(await _retry(err.requestOptions));
      } else {
        sessionExpired.add(true);
      }
    }

    if( err is SocketException ){
      throw const InternetException();
    }else if(err.response != null){
      if(err.response!.statusCode == 500 ){
        throw InternalServerException(
            err.response!.data.toString(),
        );
      } else if(err.response!.statusCode == 404 ){
        throw const NotFoundException();
      } else if(err.response!.statusCode == 401 ){
        throw const UnauthorizedException();
      } else if(err.response!.statusCode == 400 ){
        throw BadRequestException(
            err.response!.data.toString(),
        );
      }
    }else{
      throw const OtherException();
    }

    /// for other error cases it will run normally
    handler.next(err);
  }

  Future<Response<dynamic>> _retry(
    RequestOptions requestOptions,
  ) async {

    final options = Options(
      method: requestOptions.method,
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = (await authLocalDataSource.refreshToken)!;

      final response = await (Dio()
            ..options = BaseOptions(
              baseUrl: Endpoints.baseUrl,
              contentType: 'application/json',
              headers: {
                'refresh-Token': refreshToken,
              },
            ))
          .post(
        EndpointExt.path(Endpoints.refresh),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        await authLocalDataSource.persistAccessToken(
          response.data['accessToken'],
        );
        await authLocalDataSource.persistRefreshToken(
          response.data['refreshToken'],
        );

        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }
}
