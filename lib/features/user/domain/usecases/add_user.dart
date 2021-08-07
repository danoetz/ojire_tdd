import 'package:fpdart/fpdart.dart';
import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/core/usecases/usecase.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/features/user/domain/repositories/user_repository.dart';

class AddUser implements UseCase<UserEntity, NoParams> {
  final UserRepository repository;
  AddUser(this.repository);

  Future<Either<Failure, bool>> addUser({UserEntity? user}) async {
    await Future.delayed(const Duration(seconds: 1));
    return repository.addUser(user: user);
  }

  @override
  Future<Either<Failure, UserEntity>?> call(NoParams params) {
    throw UnimplementedError();
  }
}
