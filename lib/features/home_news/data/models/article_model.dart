import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/article.dart';
import 'source_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Article {
  @JsonKey(name: 'source')
  final Map<String, dynamic>? sourceJson;

  ArticleModel({
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
    super.author,
    super.sourceName,
    this.sourceJson,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  Article toEntity() => Article(
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
        author: author,
        sourceName: sourceJson?['name'] ?? '',
      );
}
