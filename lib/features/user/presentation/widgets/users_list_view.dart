import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/core/widgets/index.dart' as coreWidgets;
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';

class UsersListView extends StatelessWidget {
  final List<UserEntity> users;
  final Function fetch;
  const UsersListView({required this.users, required this.fetch});

  Widget buildUserTile2(BuildContext context, UserEntity user) {
    return ListTile(
      tileColor: Theme.of(context).accentColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(user.name!),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user.mobileNumber}",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            user.email!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      isThreeLine: true,
    ).paddingAll(5.0);
  }

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());

    if (users.isEmpty) {
      return const coreWidgets.ErrorWidget(
        'Can not find users :(',
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await fetch();
      },
      color: Theme.of(context).primaryColor,
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final user = users[index];
              return GestureDetector(
                onTap: () {
                  Get.snackbar(
                    "${user.name}",
                    "Id: ${user.id}\nMobile number: ${user.mobileNumber}\nEmail: ${user.email}\nPassword: ${user.password}",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: buildUserTile2(context, user),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              coreWidgets.CustomButton(
                text: 'Add',
                width: Get.mediaQuery.size.width / 3,
                onPressed: () async {
                  controller.changeView(ViewState.addUser);
                },
              ),
              coreWidgets.CustomButton(
                text: 'Search',
                width: Get.mediaQuery.size.width / 3,
                onPressed: () async {
                  controller.changeView(ViewState.search);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
