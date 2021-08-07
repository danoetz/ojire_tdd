import 'package:flutter/material.dart';
import 'package:ojire_tdd/core/assets/constants.dart';

class AssetImageWidget extends StatelessWidget {
  const AssetImageWidget();
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      placeholderAsset,
      fit: BoxFit.cover,
    );
  }
}
