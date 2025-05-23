import 'package:dartz/dartz.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Exception, List<Article>>> getTopHeadlines({String? category, String? query}) async {
    try {
      final articles = await remoteDataSource.getTopHeadlines(category: category, query: query);
      return Right(articles.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  
}
