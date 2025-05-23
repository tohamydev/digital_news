import 'package:digital_news/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/article.dart';
import 'breaking_news_card.dart';

class NewsItemsList extends StatelessWidget {
  final List<Article> articles;

  const NewsItemsList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      child: Column(
        key: ValueKey('loaded_news'),
        children: articles
            .map((article) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.newsDetail,
                        arguments: article,
                      );
                    },
                    child: BreakingNewsCard(
                      imageUrl: article.urlToImage ?? '',
                      title: article.title ?? '',
                      source: article.sourceName ?? '',
                      date: article.publishedAt ?? '',
                      heroTag: article.url ?? '',
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
