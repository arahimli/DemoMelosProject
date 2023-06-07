import 'package:equatable/equatable.dart';

class TokenResponseModel extends Equatable {
  const TokenResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    return TokenResponseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
