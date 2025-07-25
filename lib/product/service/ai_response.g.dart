// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiResponse _$AiResponseFromJson(Map<String, dynamic> json) => AiResponse(
  message: json['message'] as String?,
  textUrl: json['text_url'] as String?,
  imageUrl: json['image_url'] as String?,
  folder: json['folder'] as String?,
);

Map<String, dynamic> _$AiResponseToJson(AiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'text_url': instance.textUrl,
      'image_url': instance.imageUrl,
      'folder': instance.folder,
    };
