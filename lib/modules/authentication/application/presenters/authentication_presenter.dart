import 'package:custom_architecture/core/usecases/command_usecase.dart';
import 'package:custom_architecture/modules/authentication/application/view_models/authentication_view_model.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';

class AuthenticationPresenter {
  final CommandUseCase<LoginCommand, Future<AuthenticationLoginEntity>>
      loginUsecase;

  AuthenticationPresenter({
    required this.loginUsecase,
  });

  Future<AuthenticationViewModel> doLogin(LoginCommand command) async {
    AuthenticationLoginEntity loginEntity = await loginUsecase(command);

    return AuthenticationViewModel.fromEntity(
      loginEntity,
    );
  }
}
