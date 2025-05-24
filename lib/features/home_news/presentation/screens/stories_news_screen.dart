import 'package:digital_news/features/home_news/presentation/components/home_news/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/stories_news/loading_stories.dart';
import '../logic/home_news_cubit.dart';
import '../logic/home_news_state.dart';
import '../components/stories_news/stories_content.dart';

class StoriesNewsScreen extends StatefulWidget {
  const StoriesNewsScreen({Key? key}) : super(key: key);

  @override
  State<StoriesNewsScreen> createState() => _StoriesNewsScreenState();
}

class _StoriesNewsScreenState extends State<StoriesNewsScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    context.read<HomeNewsCubit>().loadTopHeadlines();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNewsCubit, HomeNewsState>(
      builder: (context, state) {
        if (state is HomeNewsLoading) {
          return LoadingStories();
        } else if (state is HomeNewsLoaded) {
          return StoriesContent(
            articles: state.articles,
            pageController: _pageController,
            currentIndexNotifier: _currentIndexNotifier,
          );
        } else if (state is HomeNewsError) {
          return ErrorState(
            message: state.message,
            onRetry: () {
              context.read<HomeNewsCubit>().loadTopHeadlines();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
