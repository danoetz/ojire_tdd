import 'package:flutter/material.dart';
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';

class RefreshIcon extends StatelessWidget {
  final UserController controller;
  const RefreshIcon({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await controller.localFetch();
      },
      child: controller.isDarkMode ? Icon(Icons.refresh) : Icon(Icons.refresh),
    );
  }
}
