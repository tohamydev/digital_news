import 'package:digital_news/core/network/remote/api_service.dart';
import 'package:digital_news/core/network/remote/api_constants.dart';
import '../models/article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines({String? category, String? query});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiService apiService;

  NewsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ArticleModel>> getTopHeadlines(
      {String? category, String? query}) async {
    final response = await apiService.getTopHeadlines(
      apiKey: ApiConstants.apiKey,
      category: category,
      query: query,
      pageSize: 100,
    );
    return response.articles;
  }
}
