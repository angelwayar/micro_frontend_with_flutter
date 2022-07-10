import 'package:get_it/get_it.dart';
import 'package:login_module/login/data/datasources/remote.datasource.dart';
import 'package:login_module/login/data/datasources/remote_imp.datasource.dart';
import 'package:login_module/login/data/repositories/remote_imp.repository.dart';
import 'package:login_module/login/domain/repositories/remote.repository.dart';
import 'package:login_module/login/domain/usecases/login_with_credentials.usecase.dart';
import 'package:main_app/main_app/presentation/cubit/login_cubit.dart';

class InjectionLogin {
  final getIt = GetIt.instance;

  void initInjectionLogin() {
    /// Data Source
    getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp());

    /// Repository
    getIt.registerLazySingleton<RemoteRepository>(
      () => RemoteRepositoryImp(
        remoteDataSource: getIt.get<RemoteDataSource>(),
      ),
    );

    /// Bloc
    getIt.registerFactory(
      () => LoginCubit(
        loginWithCredentialsUseCase: LoginWithCredentialsUseCase(
          remoteRepository: getIt.get<RemoteRepository>(),
        ),
      ),
    );
  }
}
