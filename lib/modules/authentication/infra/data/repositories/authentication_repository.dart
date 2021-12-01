import 'package:custom_architecture/core/adapters/http_adapter.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';
import 'package:custom_architecture/modules/authentication/infra/data/models/authentication_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationLoginEntity> doLogin(LoginCommand command);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final HttpAdapter http;

  AuthenticationRepositoryImpl({required this.http});

  @override
  Future<AuthenticationLoginEntity> doLogin(LoginCommand command) async {
    final response = await http.post('/url', data: {
      'email': command.email,
      'password': command.password,
    });

    return AuthenticationLogin.fromMap({
      'token': 'xpto',
      'userData': 'dados do usuário...',
    });
  }
}
