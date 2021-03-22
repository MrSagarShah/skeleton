import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/data/model/news.dart';
import 'package:skeleton/data/remote/app_dio.dart';
import 'package:skeleton/data/remote/news_data_source_impl.dart';
import 'package:skeleton/data/repository/repository_impl.dart';
import 'package:skeleton/main.dart';
import 'package:skeleton/ui/bloc/home/payroll_bloc.dart';
import 'package:skeleton/ui/bloc/home/payroll_event.dart';
import 'package:skeleton/ui/bloc/home/payroll_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeBloc bloc;
  bool isLoading = false;
  late News news;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      bloc.add(LoadHomeData());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          return HomeBloc();
        },
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          bloc = BlocProvider.of<HomeBloc>(context);

          print("STATE ${state}");
          if (state is LoadingState) {
            isLoading = state.loading;
          } else if (state is DataLoaded) {
            isLoading = false;
            if (state.result.isSuccess) {
              news = state.result.dataOrThrow;
            }
          }

          if (isLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Container(
              child: SingleChildScrollView(
            child: Column(
              children: news.articles
                  .map(
                    (e) => ListTile(
                      title: Text(
                        e.title!,
                      ),
                      subtitle: Text(e.description!),
                    ),
                  )
                  .toList(),
            ),
          ));
        }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
