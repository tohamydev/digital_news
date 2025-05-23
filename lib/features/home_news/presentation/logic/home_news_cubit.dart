import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_top_headlines.dart';
import 'home_news_state.dart';

class HomeNewsCubit extends Cubit<HomeNewsState> {
  final GetTopHeadlines getTopHeadlines;

  HomeNewsCubit({required this.getTopHeadlines}) : super(HomeNewsInitial());

  Future<void> loadTopHeadlines({String? query, String? category}) async {
    emit(HomeNewsLoading());

    final result = await getTopHeadlines(query: query, category: category);
    result.fold(
      (failure) => emit(HomeNewsError(failure.toString())),
      (articles) => emit(HomeNewsLoaded(articles)),
    );
  }
}
