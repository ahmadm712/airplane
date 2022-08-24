import 'package:airplane/features/list_news/data/datasources/news_remote_data_source.dart';
import 'package:airplane/features/list_news/data/repositories/news_repository_impl.dart';
import 'package:airplane/features/list_news/domain/usecases/get_news_headline.dart';
import 'package:airplane/features/list_news/presentation/cubit/list_news_cubit.dart';
import 'package:airplane/features/list_news/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) =>
        //       ConnectionCheckerCubit(Connectivity(), StreamSubscription()),
        //   child: Container(),
        // ),

        BlocProvider(
          create: (context) => ListNewsCubit(
            GetNewsHeadlines(
              repository: NewsRepositoryImpl(
                remoteDataSources: NewsRemoteDataSourceimpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
          child: Container(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(
            milliseconds: 300,
          ),
          backgroundColor: Colors.green,
          content: Text(
            'Succes Add Number',
          ),
        ),
      );
    });
  }

  void _decrementCounter() {
    setState(
      () {
        if (_counter > 0) {
          _counter--;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(
                milliseconds: 300,
              ),
              backgroundColor: Colors.red,
              content: Text(
                'Can\'t decress number',
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.text_decrease_sharp),
          ),
        ],
      ),
    );
  }
}
