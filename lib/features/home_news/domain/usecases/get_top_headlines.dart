import '../repositories/news_repository.dart';
import '../entities/article.dart';
import 'package:dartz/dartz.dart';

class GetTopHeadlines {
  final NewsRepository repository;

  GetTopHeadlines(this.repository);

  Future<Either<Exception, List<Article>>> call(
      {String? query, String? category}) {
    return repository.getTopHeadlines(query: query, category: category);
  }
}
