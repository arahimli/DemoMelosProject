import 'package:core/constants/endpoints.dart';
import 'package:dio/dio.dart';

import '../models/sign_in_request_model.dart';
import '../models/token_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenResponseModel> signIn(String email, String password);
  Future<bool> isAuthenticated(String accessToken);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<TokenResponseModel> signIn(String email, String password) async {
    final signInRequest = SignInRequestModel(email: email, password: password);

    final response = await dio.post(
      EndpointExt.path(Endpoints.signIn),
      data: signInRequest.toJson(),
    );

    return TokenResponseModel.fromJson(response.data);
  }

  @override
  Future<bool> isAuthenticated(String accessToken) async {
    final response = await dio.post(
      EndpointExt.path(Endpoints.verify),
      data: {'accessToken': accessToken},
    );

    return response.statusCode == 200;
  }
}
