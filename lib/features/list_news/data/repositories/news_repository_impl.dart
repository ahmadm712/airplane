// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:airplane/utils/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:airplane/features/list_news/data/datasources/news_remote_data_source.dart';
import 'package:airplane/features/list_news/domain/entities/news.dart';
import 'package:airplane/features/list_news/domain/repositories/news_repository.dart';
import 'package:airplane/utils/failure.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSources remoteDataSources;
  NewsRepositoryImpl({
    required this.remoteDataSources,
  });

  @override
  Future<Either<Failure, List<News>>> getNewsHeadline() async {
    try {
      final result = await remoteDataSources.getNewsHeadline();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }
}
