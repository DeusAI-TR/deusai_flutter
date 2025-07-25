import 'package:json_annotation/json_annotation.dart';

part 'ai_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AiResponse {
  final String? message;
  final String? textUrl;
  final String? imageUrl;
  final String? folder;

  AiResponse({this.message, this.textUrl, this.imageUrl, this.folder});

  factory AiResponse.fromJson(Map<String, dynamic> json) => _$AiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AiResponseToJson(this);
} 