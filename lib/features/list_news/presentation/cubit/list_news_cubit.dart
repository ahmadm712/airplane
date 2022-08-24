// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:airplane/features/list_news/domain/entities/news.dart';
import 'package:airplane/features/list_news/domain/usecases/get_news_headline.dart';

part 'list_news_state.dart';

class ListNewsCubit extends Cubit<ListNewsState> {
  GetNewsHeadlines getNewsHeadlines;
  ListNewsCubit(
    this.getNewsHeadlines,
  ) : super(ListNewsInitial());

  void getListNews() async {
    emit(ListNewsLoading());
    final result = await getNewsHeadlines.execute();

    result.fold(
      (failure) => emit(
        ListNewsFailed(message: failure.message),
      ),
      (data) => emit(
        ListNewsHasData(result: data),
      ),
    );
  }
}
