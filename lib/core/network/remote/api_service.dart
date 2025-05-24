// api_service.dart
// This file defines the API service for making remote HTTP requests.
// It contains methods for interacting with the backend API endpoints.

import 'package:digital_news/core/network/remote/api_constants.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../features/home_news/data/models/article_response_model.dart';

part 'api_service.g.dart';

/// Note
/// Run the following command in your terminal to generate the code:
/// `dart run build_runner build --delete-conflicting-outputs`
///
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.topHeadlines)
  Future<ArticleResponse> getTopHeadlines({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country = 'us',
    @Query('category') String? category,
    @Query('q') String? query,
    @Query('pageSize') int? pageSize = 100,
    @Query('page') int? page = 1,
  });
}
