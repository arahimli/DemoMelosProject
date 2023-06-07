import 'package:equatable/equatable.dart';

class SignInRequestModel extends Equatable {
  final String email;
  final String password;

  const SignInRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [email, password];
}
