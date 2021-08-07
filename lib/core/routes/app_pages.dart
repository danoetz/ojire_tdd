import 'package:get/get.dart';
import 'package:ojire_tdd/features/loading/presentation/getx/loading_binding.dart';
import 'package:ojire_tdd/features/loading/presentation/pages/loading_view.dart';
import 'package:ojire_tdd/features/user/presentation/getx/user_binding.dart';
import 'package:ojire_tdd/features/user/presentation/pages/user_page.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOADING;

  static final routes = [
    GetPage(
      name: Routes.USER,
      page: () => UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingView(),
      binding: LoadingBinding(),
    ),
  ];
}
