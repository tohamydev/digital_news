import 'package:digital_news/core/components/app_logo.dart';
import 'package:digital_news/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLogo(
      width: 40.w,
      height: 40.w,
    );
  }
}
