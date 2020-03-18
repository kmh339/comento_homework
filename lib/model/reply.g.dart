// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) {
  return Reply(
    id: json['id'] as int,
    user_id: json['user_id'] as int,
    parent: json['parent'] as int,
    contents: json['contents'] as String,
    created_at: json['created_at'] as String,
  );
}

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'parent': instance.parent,
      'contents': instance.contents,
      'created_at': instance.created_at,
    };
