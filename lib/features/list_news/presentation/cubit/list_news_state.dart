// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_news_cubit.dart';

abstract class ListNewsState extends Equatable {
  const ListNewsState();

  @override
  List<Object> get props => [];
}

class ListNewsInitial extends ListNewsState {}

class ListNewsLoading extends ListNewsState {}

class ListNewsHasData extends ListNewsState {
  final List<News> result;
  const ListNewsHasData({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

class ListNewsFailed extends ListNewsState {
  final String message;
  const ListNewsFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
