import 'package:digital_news/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const NewsSearchBar({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        style: TextStyle(
          color: AppColors.text,
          fontSize: 16.sp,
        ),
        decoration: InputDecoration(
          hintText: 'Search news...',
          hintStyle: TextStyle(
            color: AppColors.text.withOpacity(0.5),
            fontSize: 16.sp,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.text.withOpacity(0.5),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
  }
}
