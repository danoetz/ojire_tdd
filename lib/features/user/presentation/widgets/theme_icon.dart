import 'package:flutter/material.dart';
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';

class ThemeIcon extends StatelessWidget {
  final UserController controller;
  const ThemeIcon({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.changeTheme(),
      child: controller.isDarkMode ? Icon(Icons.dark_mode, color: Colors.black) : Icon(Icons.light_mode),
    );
  }
}
