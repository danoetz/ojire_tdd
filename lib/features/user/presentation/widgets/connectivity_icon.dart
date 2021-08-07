import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';

class ConnectivityIcon extends StatelessWidget {
  final UserController controller;
  const ConnectivityIcon({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.connectivityResult.value) {
        case InternetConnectionStatus.disconnected:
          return const Icon(Icons.signal_wifi_off);
        case InternetConnectionStatus.connected:
          return const Icon(Icons.wifi);
        default:
          return Container();
      }
    });
  }
}
