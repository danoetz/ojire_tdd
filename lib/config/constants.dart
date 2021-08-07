import 'package:flutter/foundation.dart';

class Api {
  static const String URL_DEV = 'https://my-json-server.typicode.com/NocturnScholar/nocturnscholar.github.io';
  static const String URL_PROD = 'https://my-json-server.typicode.com/NocturnScholar/nocturnscholar.github.io';

  static const String BASE_URL = kReleaseMode ? URL_PROD : URL_DEV;

  // endpoint
  static const String USER = '/data';
}

class Db {
  static const String USER_BOX = 'user_box';
}
