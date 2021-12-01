import 'package:custom_architecture/core/usecases/query_usecase.dart';
import 'package:custom_architecture/modules/authentication/domain/repositories/authentication_repository.dart';

class GetUserUseCase implements QueryUseCase<String?> {
  final AuthenticationRepository _authRepository;

  GetUserUseCase(this._authRepository);

  @override
  String? call() {
    return _authRepository.getAuthUser();
  }
}
