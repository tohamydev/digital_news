import 'package:json_annotation/json_annotation.dart';
import 'source_model.dart';

part 'source_response_model.g.dart';

@JsonSerializable()
class SourceResponse {
  final String status;
  final List<Source> sources;

  SourceResponse({
    required this.status,
    required this.sources,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}
