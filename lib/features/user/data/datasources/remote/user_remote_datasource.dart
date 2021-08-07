import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/features/user/data/api/api.dart';
import 'package:ojire_tdd/features/user/data/models/user.dart';

const ERROR_MSG = 'Something went wrong';

class UserRemoteDatasource {
  final UserRestClient client;
  UserRemoteDatasource({required this.client});

  /// get users from api endpoint
  /// return Failure if catch error or status code is not 200
  /// return decoded data as Map if status code is 200
  Future<Either<Failure, List<User>>> getUsers({
    String? mobileNumber,
    String? password,
  }) async {
    try {
      final users = await client.getUsers(mobileNumber, password);
      return Right(users);
    } on DioError catch (error) {
      print(error.type);
      print(error.message);
      return Left(DioFailure(message: error.message));
    } on Exception catch (_) {
      return const Left(ServerFailure(message: ERROR_MSG));
    }
  }
}
