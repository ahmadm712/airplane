// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:airplane/features/list_news/domain/entities/news.dart';
import 'package:airplane/features/list_news/domain/repositories/news_repository.dart';
import 'package:airplane/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetNewsHeadlines {
  final NewsRepository repository;
  GetNewsHeadlines({
    required this.repository,
  });

  Future<Either<Failure, List<News>>> execute() {
    return repository.getNewsHeadline();
  }
}
