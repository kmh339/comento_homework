// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ads _$AdsFromJson(Map<String, dynamic> json) {
  return Ads(
    id: json['id'] as int,
    title: json['title'] as String,
    contents: json['contents'] as String,
    img: json['img'] as String,
    created_at: json['created_at'] as String,
  );
}

Map<String, dynamic> _$AdsToJson(Ads instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'img': instance.img,
      'created_at': instance.created_at,
    };
