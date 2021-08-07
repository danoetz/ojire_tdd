import 'package:ojire_tdd/config/constants.dart';
import 'package:ojire_tdd/features/user/data/models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: Api.BASE_URL)
abstract class UserRestClient {
  factory UserRestClient(Dio dio, {String baseUrl}) = _UserRestClient;

  @GET(Api.USER)
  Future<List<User>> getUsers(
    @Path('mobileNumber') String? mobileNumber,
    @Path('password') String? password,
  );
}
