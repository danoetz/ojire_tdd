// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCore() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => InternetConnectionChecker())
      ..registerSingleton<NetworkInfoI>(
          (c) => NetworkInfo(c<InternetConnectionChecker>()));
  }

  @override
  void _configureUserFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => UserRemoteDatasource(client: c<UserRestClient>()))
      ..registerFactory((c) => UserLocalDatasource())
      ..registerFactory((c) => GetLocalUsers(c<UserRepository>()))
      ..registerFactory((c) => GetRemoteUsers(c<UserRepository>()))
      ..registerFactory((c) => AddUser(c<UserRepository>()))
      ..registerFactory<UserRepository>((c) => UserRepositoryImpl(
          localDataSource: c<UserLocalDatasource>(),
          remoteDataSource: c<UserRemoteDatasource>()));
  }
}
