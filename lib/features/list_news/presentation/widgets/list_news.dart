import 'package:airplane/features/list_news/presentation/cubit/list_news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListNews extends StatelessWidget {
  const ListNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListNewsCubit, ListNewsState>(
      builder: (context, state) {
        if (state is ListNewsHasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final news = state.result[index];
              return Card(
                child: ListTile(
                  title: Text(news.title!),
                ),
              );
            },
            itemCount: state.result.length,
          );
        } else if (state is ListNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container();
      },
    );
  }
}
