// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Newsapi _$NewsapiFromJson(Map<String, dynamic> json) => Newsapi(
  status: json['status'] as String?,
  totalResults: (json['totalResults'] as num?)?.toInt(),
  articles: (json['articles'] as List<dynamic>?)
      ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NewsapiToJson(Newsapi instance) => <String, dynamic>{
  'status': instance.status,
  'totalResults': instance.totalResults,
  'articles': instance.articles,
};
