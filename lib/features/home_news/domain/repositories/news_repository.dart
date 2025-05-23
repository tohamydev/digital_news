import '../entities/article.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Exception, List<Article>>> getTopHeadlines(
      {String? query, String? category});
}
