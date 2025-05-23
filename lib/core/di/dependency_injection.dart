import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/remote/api_constants.dart';
import '../network/remote/api_service.dart';
import '../network/remote/dio_factory.dart';
import '../../features/home_news/data/datasources/news_remote_data_source.dart';
import '../../features/home_news/data/repositories/news_repository_impl.dart';
import '../../features/home_news/domain/repositories/news_repository.dart';
import '../../features/home_news/domain/usecases/get_top_headlines.dart';
import '../../features/home_news/presentation/logic/home_news_cubit.dart';

final getit = GetIt.instance;

Future<void> setGetIt() async {
  // Network
  Dio dio = await DioFactory.getDio();
  getit.registerLazySingleton<ApiService>(
      () => ApiService(dio, baseUrl: ApiConstants.baseUrl));

  getit.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(apiService: getit<ApiService>()),
  );

  getit.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(remoteDataSource: getit<NewsRemoteDataSource>()),
  );
  getit.registerLazySingleton<GetTopHeadlines>(
    () => GetTopHeadlines(getit<NewsRepository>()),
  );
  getit.registerFactory<HomeNewsCubit>(
    () => HomeNewsCubit(getTopHeadlines: getit<GetTopHeadlines>()),
  );
}
