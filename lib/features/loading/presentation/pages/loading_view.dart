import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../getx/loading_controller.dart';

const List<Color> _kDefaultRainbowColors = const [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class LoadingView extends GetView<LoadingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.mediaQuery.size.width / 3,
          height: Get.mediaQuery.size.width / 3,
          child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: _kDefaultRainbowColors,
          ),
        ),
      ),
    );
  }
}
