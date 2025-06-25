import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'newsapi.g.dart';

@JsonSerializable()
class Newsapi {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Newsapi({this.status, this.totalResults, this.articles});

  factory Newsapi.fromJson(Map<String, dynamic> json) {
    return _$NewsapiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsapiToJson(this);
}
