import 'package:custom_architecture/core/usecases/command_usecase.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';
import 'package:custom_architecture/modules/authentication/domain/repositories/authentication_repository.dart';

class LoginUseCase
    implements CommandUseCase<LoginCommand, Future<AuthenticationLoginEntity>> {
  final AuthenticationRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<AuthenticationLoginEntity> call(LoginCommand command) {
    return _authRepository.doLogin(command);
  }
}
