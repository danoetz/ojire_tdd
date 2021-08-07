import 'package:fpdart/fpdart.dart';
import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/features/user/data/datasources/local/user_local_datasource.dart';
import 'package:ojire_tdd/features/user/data/datasources/remote/user_remote_datasource.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.localDataSource, required this.remoteDataSource});
  // local data source
  final UserLocalDatasource localDataSource;
  // remote data source
  final UserRemoteDatasource remoteDataSource;

  /// return either failure or list of users
  @override
  Future<Either<Failure, List<UserEntity>>> getRemoteUsers({String? mobileNumber, String? password}) async {
    try {
      final response = await remoteDataSource.getUsers(mobileNumber: mobileNumber, password: password);
      return response.fold((failure) => Left(failure), (users) async {
        if (users.isNotEmpty) {
          await localDataSource.insertUsers(users);
          final converted = users
              .map(
                (e) => UserEntity(
                  id: e.id,
                  name: e.name,
                  mobileNumber: e.mobileNumber,
                  email: e.email,
                  password: e.password,
                  pin: e.pin,
                ),
              )
              .toList();
          return Right(converted);
        }
        return const Left(CacheFailure(message: 'Can not find users right now'));
      });
    } on Exception catch (e) {
      print(e.toString());
      return const Left(ServerFailure(message: 'Something went wrong'));
    }
  }

  /// return either failure or list of users from saved local database
  @override
  Future<Either<Failure, List<UserEntity>>> getLocalUsers() async {
    final users = await localDataSource.getUsers();
    if (users.isEmpty) {
      return const Left(CacheFailure(message: 'No internet connection'));
    }

    return Right(users);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> searchLocalUsers({String? mobileNumber, String? password}) async {
    final users = await localDataSource.searchUsers(mobileNumber: mobileNumber, password: password);
    if (users.isEmpty) {
      return const Left(CacheFailure(message: 'No internet connection'));
    }

    return Right(users);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getCachedUsers() {
    // TODO: implement getCachedUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> addUser({UserEntity? user}) async {
    final users = await localDataSource.addUser(user: user);
    if (!users) {
      return const Left(CacheFailure(message: 'No internet connection'));
    }
    return Right(users);
  }
}
