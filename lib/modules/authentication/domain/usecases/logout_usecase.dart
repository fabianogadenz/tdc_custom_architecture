import 'package:custom_architecture/core/usecases/query_usecase.dart';
import 'package:custom_architecture/modules/authentication/domain/repositories/authentication_repository.dart';

class LogoutUseCase implements QueryUseCase<void> {
  final AuthenticationRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  void call() {
    _authRepository.logout();
  }
}
