import 'package:digital_news/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double width;
  final String? imagePath;
  
  const AppLogo({
    Key? key,
    this.height = 120,
    this.width = 120,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath ?? AppAssets.appLogo,
      height: height,
      width: width,
    );
  }
}