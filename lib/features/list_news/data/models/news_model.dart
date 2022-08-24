// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'package:airplane/features/list_news/data/models/source_model.dart';
import 'package:airplane/features/list_news/domain/entities/news.dart';
import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
      };

  News toEntity() {
    return News(
      author: author,
      content: content,
      description: description,
      publishedAt: publishedAt,
      source: source!.toEntity(),
      title: title,
      url: url,
      urlToImage: urlToImage,
    );
  }

  @override
  List<Object?> get props => [
        author,
        content,
        description,
        publishedAt,
        source,
        title,
        url,
        urlToImage,
      ];
}
