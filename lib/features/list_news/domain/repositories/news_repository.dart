import 'package:airplane/features/list_news/domain/entities/news.dart';
import 'package:airplane/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getNewsHeadline();
}
