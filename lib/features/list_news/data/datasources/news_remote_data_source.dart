// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:airplane/features/list_news/data/models/news_model.dart';
import 'package:airplane/features/list_news/data/models/news_response_model.dart';
import 'package:airplane/utils/exceptions.dart';
import 'package:airplane/utils/utils.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSources {
  Future<List<NewsModel>> getNewsHeadline();
}

class NewsRemoteDataSourceimpl implements NewsRemoteDataSources {
  final http.Client client;
  NewsRemoteDataSourceimpl({
    required this.client,
  });

  @override
  Future<List<NewsModel>> getNewsHeadline() async {
    final response = await client
        .get(Uri.parse('${baseUrl}top-headlines?country=id&apiKey=$keyApi'));

    if (response.statusCode == 200) {
      return NewsResponseModel.fromJson(json.decode(response.body)).articles!;
    } else {
      throw ServerException();
    }
  }
}
