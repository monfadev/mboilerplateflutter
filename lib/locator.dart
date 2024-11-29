import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mboilerplateflutter/data/datasources/authentication/authentication_remote_data_source.dart';
import 'package:mboilerplateflutter/data/repositories/authentication/authentication_repository_impl.dart';
import 'package:mboilerplateflutter/data/services/api/network_client.dart';
import 'package:mboilerplateflutter/domain/repositories/authentication/authentication_repository.dart';
import 'package:mboilerplateflutter/domain/usecases/authentication/post_login_tablet_use_case.dart';
import 'package:mboilerplateflutter/presentation/statemanagement/authentication/login_tablet/login_tablet_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // network
  if (!locator.isRegistered(instance: Dio())) {
    locator.registerSingleton(Dio());
  }

  if (!locator.isRegistered(instance: CancelToken())) {
    locator.registerSingleton(CancelToken());
  }

  /// layer data
  // api service
  locator.registerLazySingleton(() => NetworkClient(locator()));

  // remote data source
  locator.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  /// layer domain
  // implementation data source
  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => PostLoginTabletUseCase(locator()));

  /// layer presentation
  // statemanagement
  locator.registerFactory(
    () => LoginTabletBloc(
      postLoginTabletUseCase: locator(),
      cancelToken: locator(),
    ),
  );
}
