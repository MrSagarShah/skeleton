import 'package:flutter/material.dart';
import 'package:skeleton/data/repository/repository.dart';
import 'package:skeleton/routes.dart';
import 'package:skeleton/ui/home/ui/home.dart';

import 'constants/app_theme.dart';
import 'data/remote/app_dio.dart';
import 'data/remote/news_data_source_impl.dart';
import 'data/repository/repository_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes.routes,
      theme: themeData,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Repo {
  static Repository getInstance() {
    return RepositoryImpl(
      dataSource: DataSourceImpl(
        dio: AppDio.getInstance(),
      ),
    );
  }
}
