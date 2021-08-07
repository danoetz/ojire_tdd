import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';
import 'package:ojire_tdd/features/user/presentation/widgets/add_user_view.dart';
import 'package:ojire_tdd/features/user/presentation/widgets/search_view.dart';
import 'package:ojire_tdd/features/user/presentation/widgets/users_list_view.dart';
import 'package:ojire_tdd/core/widgets/index.dart' as coreWidgets;
import 'package:ojire_tdd/features/user/presentation/widgets/widgets.dart' as widgets;

class UserPage extends GetView<UserController> {
  late final appdata = GetStorage();

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 8.0,
      title: Text(
        'o | ji | re',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ).paddingAll(4.0),
      actions: [
        widgets.RefreshIcon(controller: controller).paddingOnly(right: 10.0),
        widgets.ConnectivityIcon(controller: controller).paddingOnly(right: 10.0),
        widgets.ThemeIcon(controller: controller).paddingOnly(right: 10.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Obx(() {
        switch (controller.viewState.value) {
          case ViewState.busy:
            return coreWidgets.LoadingWidget();
          case ViewState.error:
            return coreWidgets.ErrorWidget();
          case ViewState.data:
            return UsersListView(users: controller.users, fetch: controller.localFetch);
          case ViewState.search:
            return SearchView();
          case ViewState.addUser:
            return AddUserView();
          default:
            return coreWidgets.LoadingWidget();
        }
      }),
    );
  }
}
