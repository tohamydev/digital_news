import 'package:json_annotation/json_annotation.dart';
import 'article_model.dart';

part 'article_response_model.g.dart';

@JsonSerializable()
class ArticleResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  ArticleResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
