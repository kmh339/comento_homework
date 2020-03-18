// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return Detail(
    id: json['id'] as int,
    title: json['title'] as String,
    contents: json['contents'] as String,
    category_id: json['category_id'] as int,
    user_id: json['user_id'] as int,
    created_at: json['created_at'] as String,
  );
}

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'category_id': instance.category_id,
      'user_id': instance.user_id,
      'created_at': instance.created_at,
    };
