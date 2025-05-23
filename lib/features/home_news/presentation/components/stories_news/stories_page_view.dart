import 'package:flutter/material.dart';
import '../../../domain/entities/article.dart';
import 'news_story_card_item.dart';

class StoriesPageView extends StatelessWidget {
  final List<Article> articles;
  final PageController pageController;
  final ValueNotifier<int> currentIndexNotifier;

  const StoriesPageView({
    Key? key,
    required this.articles,
    required this.pageController,
    required this.currentIndexNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        currentIndexNotifier.value = index;
      },
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return NewsStoryCard(
          imageUrl: article.urlToImage ?? '',
          title: article.title ?? '',
          description: article.description ?? '',
          source: article.sourceName ?? '',
          date: article.publishedAt ?? '',
        );
      },
    );
  }
}
