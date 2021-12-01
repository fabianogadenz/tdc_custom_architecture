import 'package:custom_architecture/core/adapters/data_storage/data_storage_adapter.dart';
import 'package:custom_architecture/core/adapters/data_storage/data_storage_adapter_get.dart';
import 'package:custom_architecture/core/adapters/http/http_adapter.dart';
import 'package:custom_architecture/core/adapters/http/http_adapter_dio.dart';
import 'package:custom_architecture/core/controllers/app_controller.dart';
import 'package:custom_architecture/core/usecases/command_usecase.dart';
import 'package:custom_architecture/core/usecases/query_usecase.dart';
import 'package:custom_architecture/modules/authentication/application/presenters/authentication_presenter.dart';
import 'package:custom_architecture/modules/authentication/domain/commands/login_command.dart';
import 'package:custom_architecture/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:custom_architecture/modules/authentication/domain/usecases/get_user_usecase.dart';
import 'package:custom_architecture/modules/authentication/domain/usecases/login_usecase.dart';
import 'package:custom_architecture/modules/authentication/domain/usecases/logout_usecase.dart';
import 'package:custom_architecture/modules/authentication/infra/data/repositories/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialBinding implements Bindings {
  final GetStorage getStorage;

  InitialBinding(this.getStorage);

  @override
  void dependencies() {
    // Adapters
    Get.put<HttpAdapter>(HttpAdapterDio(Dio()));
    Get.put<DataStorageAdapter>(
      DataStorageAdapterGet(
        getStorage,
      ),
    );

    // Auth
    Get.put<AuthenticationRepository>(
      AuthenticationRepositoryImpl(
        http: Get.find(),
        storage: Get.find(),
      ),
    );
    Get.put<CommandUseCase<LoginCommand, Future<void>>>(
      LoginUseCase(Get.find()),
    );
    Get.put<QueryUseCase<void>>(
      LogoutUseCase(Get.find()),
    );
    Get.put<QueryUseCase<String?>>(
      GetUserUseCase(Get.find()),
    );
    Get.put(
      AuthenticationPresenter(
        loginUseCase: Get.find(),
        getAuthUserUseCase: Get.find(),
        logoutUseCase: Get.find(),
      ),
    );

    Get.put<AppController>(
      AppController(authPresenter: Get.find()),
      permanent: true,
    );
  }
}
