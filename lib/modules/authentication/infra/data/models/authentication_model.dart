import 'dart:convert';

import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';

class AuthenticationLogin extends AuthenticationLoginEntity {
  final String token;
  final String userData;

  AuthenticationLogin({
    required this.token,
    required this.userData,
  });

  factory AuthenticationLogin.fromMap(Map<String, dynamic> json) {
    return AuthenticationLogin(
      token: json['token'],
      userData: json['userData'],
    );
  }

  factory AuthenticationLogin.fromJson(String source) =>
      AuthenticationLogin.fromMap(json.decode(source));
}
