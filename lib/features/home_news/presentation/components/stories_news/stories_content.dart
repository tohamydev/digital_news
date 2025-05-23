import 'package:flutter/material.dart';
import '../../../domain/entities/article.dart';
import 'stories_page_view.dart';
import 'top_bar.dart';

class StoriesContent extends StatelessWidget {
  final List<Article> articles;
  final PageController pageController;
  final ValueNotifier<int> currentIndexNotifier;

  const StoriesContent({
    Key? key,
    required this.articles,
    required this.pageController,
    required this.currentIndexNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          StoriesPageView(
            articles: articles,
            pageController: pageController,
            currentIndexNotifier: currentIndexNotifier,
          ),
          const TopBar(),
        ],
      ),
    );
  }
}
