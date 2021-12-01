import 'package:custom_architecture/core/controllers/app_controller.dart';
import 'package:custom_architecture/core/models/error_message_model.dart';
import 'package:custom_architecture/core/routes/routes_app.dart';
import 'package:custom_architecture/core/validators/string_validators.dart';
import 'package:custom_architecture/modules/authentication/application/presenters/authentication_presenter.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:get/get.dart';

class LoginController {
  final AuthenticationPresenter authPresenter;
  final AppController appController;
  final bool Function(String?) isStringNotEmpty;

  LoginController({
    required this.authPresenter,
    required this.appController,
    this.isStringNotEmpty = StringValidators.isNotEmpty,
  });

  String? isEmailValid(String? value) =>
      isFieldEmpty(value) ??
      (GetUtils.isEmail(value!) ? null : 'Insira um email válido!');

  String? isFieldEmpty(String? value) =>
      isStringNotEmpty(value) ? null : 'Preencha o campo e tente novamente!';

  login(String email, String password) async {
    appController.setIsLoading(true);

    try {
      await authPresenter.login(
        LoginCommand(email: email, password: password),
      );

      Get.toNamed(RoutesApp.homeScreen);
    } on ErrorMessageModel catch (e) {
      appController.setError(e);
    } catch (e) {
      appController.setError(ErrorMessageModel('Algo deu errado!'));
    }
  }
}
