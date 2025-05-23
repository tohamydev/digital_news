import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/function_helper.dart';
import '../shared/news_image.dart';

class BreakingNewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String source;
  final String date;
  final String heroTag;

  const BreakingNewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.source,
    required this.date,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Hero(
            tag: 'image-$heroTag',
            child: NewsImage(
              imageUrl: imageUrl,
              width: double.infinity,
              height: 200.h,
            ),
          ),
          Positioned(
            top: 16.h,
            right: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.liveRed,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.circle, color: Colors.white, size: 12.sp),
                  SizedBox(width: 4.w),
                  Text('New',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.9),
                  ],
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'title-$heroTag',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.newspaper,
                            color: AppColors.primary, size: 14.sp),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        source,
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                      Spacer(),
                      Text(
                        FunctionHelper.formatFullDateTime(date),
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
