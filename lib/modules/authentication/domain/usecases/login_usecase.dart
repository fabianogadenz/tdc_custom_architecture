import 'package:custom_architecture/core/usecases/command_usecase.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/repositories/authentication_repository.dart';

class LoginUseCase implements CommandUseCase<LoginCommand, Future<void>> {
  final AuthenticationRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<void> call(LoginCommand command) async {
    final auth = await _authRepository.doLogin(command);

    if (auth.token != null && auth.userData != null) {
      _authRepository.saveLocalUser(auth.token!, auth.userData!);
    }
  }
}
