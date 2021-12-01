import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationLoginEntity> doLogin(LoginCommand command);
  void saveLocalUser(String token, String name);
  void logout();
  String? getAuthUser();
}
