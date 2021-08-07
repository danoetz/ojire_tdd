import 'dart:async';

import 'package:get/get.dart';
import 'package:ojire_tdd/core/routes/app_pages.dart';
import 'package:ojire_tdd/features/user/data/datasources/local/user_local_datasource.dart';
import 'package:ojire_tdd/injector/injector.dart';

class LoadingController extends GetxController {
  @override
  Future onInit() async {
    super.onInit();
    await Injector.resolve<UserLocalDatasource>().initDb();
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(Routes.USER);
  }
}
