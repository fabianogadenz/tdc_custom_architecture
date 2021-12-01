import 'package:custom_architecture/core/usecases/command_usecase.dart';
import 'package:custom_architecture/core/usecases/query_usecase.dart';
import 'package:custom_architecture/modules/authentication/application/view_models/user_view_model.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';

class AuthenticationPresenter {
  final CommandUseCase<LoginCommand, Future<void>> loginUseCase;
  final QueryUseCase<void> logoutUseCase;
  final QueryUseCase<String?> getAuthUserUseCase;

  AuthenticationPresenter({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.getAuthUserUseCase,
  });

  Future<void> login(LoginCommand command) async {
    await loginUseCase(command);
  }

  Future<void> logout() async {
    logoutUseCase();
  }

  UserViewModel? getUser() {
    final name = getAuthUserUseCase();

    if (name != null) {
      return UserViewModel(name: name, email: 'zeucxb@gmail.com');
    }
  }
}
