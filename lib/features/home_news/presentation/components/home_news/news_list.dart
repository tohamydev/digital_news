import 'package:digital_news/features/home_news/presentation/logic/home_news_cubit.dart';
import 'package:digital_news/features/home_news/presentation/logic/home_news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shimmer_loading.dart';
import 'no_news_found.dart';
import 'news_items_list.dart';
import 'error_state.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNewsCubit, HomeNewsState>(
      builder: (context, state) {
        if (state is HomeNewsLoading) {
          return const ShimmerLoading();
        } else if (state is HomeNewsLoaded) {
          if (state.articles.isEmpty) {
            return const NoNewsFound();
          }
          return NewsItemsList(articles: state.articles);
        } else if (state is HomeNewsError) {
          return ErrorState(message: state.message);
        }
        return const SizedBox();
      },
    );
  }
}
