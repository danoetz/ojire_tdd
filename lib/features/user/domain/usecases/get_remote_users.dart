import 'package:fpdart/fpdart.dart';
import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/core/usecases/usecase.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/features/user/domain/repositories/user_repository.dart';

class GetRemoteUsers implements UseCase<List<UserEntity>, NoParams> {
  final UserRepository repository;
  GetRemoteUsers(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.getCachedUsers();
  }

  Future<Either<Failure, List<UserEntity>>> getRemoteUsers({String? mobileNumber, String? password}) async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.getRemoteUsers(mobileNumber: mobileNumber, password: password);
  }
}
