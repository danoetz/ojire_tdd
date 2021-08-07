import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojire_tdd/core/network/network_info.dart';
import 'package:ojire_tdd/features/user/data/api/api.dart';
import 'package:ojire_tdd/features/user/data/datasources/local/user_local_datasource.dart';
import 'package:ojire_tdd/features/user/data/datasources/remote/user_remote_datasource.dart';
import 'package:ojire_tdd/features/user/data/repositories/user_repository_impl.dart';
import 'package:ojire_tdd/features/user/domain/repositories/user_repository.dart';
import 'package:ojire_tdd/features/user/domain/usecases/add_user.dart';
import 'package:ojire_tdd/features/user/domain/usecases/get_local_users.dart';
import 'package:ojire_tdd/features/user/domain/usecases/get_remote_users.dart';

part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static late final resolve = container.resolve;

  void _configure() {
    _configureCore();
    _configureUserFeatureModule();
  }

  // Core module
  @Register.singleton(InternetConnectionChecker)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  void _configureCore();

  // User Feature module
  void _configureUserFeatureModule() {
    _configureUserFeatureModuleInstances();
    _configureUserFeatureModuleFactories();
  }

  // User Feature module instances
  void _configureUserFeatureModuleInstances() {
    container.registerInstance(UserRestClient(Dio(BaseOptions(contentType: "application/json"))));
  }

  // User Feature module factories
  @Register.factory(UserRemoteDatasource)
  @Register.factory(UserLocalDatasource)
  @Register.factory(GetLocalUsers)
  @Register.factory(GetRemoteUsers)
  @Register.factory(AddUser)
  @Register.factory(UserRepository, from: UserRepositoryImpl)
  void _configureUserFeatureModuleFactories();
}
