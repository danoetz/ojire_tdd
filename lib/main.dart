import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:ojire_tdd/core/routes/app_pages.dart';
import 'package:ojire_tdd/core/theme/theme_data.dart';
import 'package:ojire_tdd/injector/injector.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path + '/.data');
  await GetStorage.init();
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appdata = GetStorage(); // instance of GetStorage
  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    return SimpleBuilder(
      builder: (_) {
        bool isDarkMode = appdata.read('darkmode');
        return GetMaterialApp(
          theme: lightThemeData(),
          darkTheme: darkThemeData(),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          // defaultTransition: Transition.cupertino,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
