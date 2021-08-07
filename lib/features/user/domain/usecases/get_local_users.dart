import 'package:fpdart/fpdart.dart';
import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/core/usecases/usecase.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/features/user/domain/repositories/user_repository.dart';

class GetLocalUsers implements UseCase<List<UserEntity>, NoParams> {
  final UserRepository repository;
  GetLocalUsers(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.getLocalUsers();
  }

  Future<Either<Failure, List<UserEntity>>> searchLocalUsers({String? mobileNumber, String? password}) async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.searchLocalUsers(mobileNumber: mobileNumber, password: password);
  }
}
