import 'package:custom_architecture/modules/authentication/domain/entities/authentication_login_entity.dart';

class AuthenticationViewModel {
  final String? userData;

  AuthenticationViewModel({
    this.userData,
  });

  factory AuthenticationViewModel.fromEntity(
    AuthenticationLoginEntity loginEntity,
  ) {
    return AuthenticationViewModel(
      userData: loginEntity.userData,
    );
  }
}
