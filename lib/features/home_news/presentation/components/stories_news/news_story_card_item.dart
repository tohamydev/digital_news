import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/function_helper.dart';

class NewsStoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String source;
  final String date;

  const NewsStoryCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.source,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[900]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[900],
            child: Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 50.sp,
            ),
          ),
        ),
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        // Content
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 100.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16.sp,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.newspaper,
                        color: AppColors.primary, size: 16.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    source,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '•',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    FunctionHelper.formatDateTime(date),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
