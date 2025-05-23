import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class NewsImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;

  const NewsImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Container(
        width: width,
        height: height,
        color: AppColors.card,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.broken_image,
                color: AppColors.text.withOpacity(0.5),
                size: 40,
              ),
              SizedBox(height: 8),
              Text(
                'Image not found',
                style: TextStyle(
                  color: AppColors.text.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: AppColors.card,
          highlightColor: AppColors.card.withOpacity(0.5),
          child: Container(
            width: width,
            height: height,
            color: AppColors.card,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: AppColors.card,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.broken_image,
                  color: AppColors.text.withOpacity(0.5),
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Image not found',
                  style: TextStyle(
                    color: AppColors.text.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
