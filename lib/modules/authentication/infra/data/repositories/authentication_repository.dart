import 'package:custom_architecture/core/adapters/data_storage/data_storage_adapter.dart';
import 'package:custom_architecture/core/adapters/http/http_adapter.dart';
import 'package:custom_architecture/core/models/error_message_model.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';
import 'package:custom_architecture/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:custom_architecture/modules/authentication/infra/data/models/authentication_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final HttpAdapter http;
  final DataStorageAdapter storage;

  AuthenticationRepositoryImpl({
    required this.http,
    required this.storage,
  });

  @override
  Future<AuthenticationLoginEntity> doLogin(LoginCommand command) async {
    // final response = await http.post('/url', data: {
    //   'email': command.email,
    //   'password': command.password,
    // });

    await Future.delayed(const Duration(seconds: 1));

    if (command.email != 'zeucxb@gmail.com') {
      throw ErrorMessageModel('Email e/ou senha inválidos');
    }

    return AuthenticationLogin.fromMap({
      'token': 'xpto',
      'userData': 'Eliseu Codinhoto ${DateTime.now()}',
    });
  }

  @override
  void saveLocalUser(String token, String name) {
    storage.save('token', token);
    storage.save('user', name);
    http.setAccessToken(token);
  }

  @override
  String? getAuthUser() => storage.get('user');

  @override
  void logout() {
    storage.remove('token');
    storage.remove('user');
  }
}
