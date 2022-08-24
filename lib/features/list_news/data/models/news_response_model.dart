// To parse this JSON data, do
//
//     final newsResponseModel = newsResponseModelFromJson(jsonString);

import 'package:airplane/features/list_news/data/models/news_model.dart';
import 'package:equatable/equatable.dart';

class NewsResponseModel extends Equatable {
  NewsResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<NewsModel>? articles;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<NewsModel>.from(
            json["articles"].map((x) => NewsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [articles];
}
