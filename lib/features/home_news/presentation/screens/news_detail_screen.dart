import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/article.dart';
import '../components/shared/news_image.dart';
import '../../../../core/utils/function_helper.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.urlToImage != null &&
                    article.urlToImage!.isNotEmpty)
                  Hero(
                    tag: 'image-${article.url}',
                    child: NewsImage(
                      imageUrl: article.urlToImage!,
                      width: double.infinity,
                      height: 300.h,
                      borderRadius: 0,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'title-${article.url}',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            article.title ?? '',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          if (article.author != null &&
                              article.author!.isNotEmpty)
                            Expanded(
                              child: Text(
                                article.author!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.text.withOpacity(0.7),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (article.publishedAt != null &&
                              article.publishedAt!.isNotEmpty)
                            Text(
                              FunctionHelper.formatFullDateTime(
                                  article.publishedAt!),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.text.withOpacity(0.7),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        article.content ?? article.description ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.text,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 8.w,
            child: IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.text,
                  size: 20.sp,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
