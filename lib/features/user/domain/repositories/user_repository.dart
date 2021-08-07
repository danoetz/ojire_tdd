import 'package:fpdart/fpdart.dart';
import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> searchLocalUsers({String? mobileNumber, String? password});
  Future<Either<Failure, List<UserEntity>>> getLocalUsers();

  Future<Either<Failure, List<UserEntity>>> getRemoteUsers({String? mobileNumber, String? password});
  Future<Either<Failure, List<UserEntity>>> getCachedUsers();
  Future<Either<Failure, bool>> addUser({UserEntity? user});
}
