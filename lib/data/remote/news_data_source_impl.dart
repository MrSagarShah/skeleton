import 'dart:math';

import 'package:dio/dio.dart';
import 'package:skeleton/constants/constants.dart';

import '../../utils/ext/date_time.dart';
import '../model/news.dart';
import 'news_data_source.dart';

class DataSourceImpl implements DataSource {
  DataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<News> getNews() {
    return _dio.get<Map<String, dynamic>>(
      '/v2/everything',
      queryParameters: <String, String>{
        'q': ['anim', 'manga'][Random().nextInt(2)], // For checking reload.
        'from': DateTime.now()
            .subtract(
          const Duration(days: 28),
        )
            .toLocal()
            .formatYYYYMMdd(),
        'sortBy': 'publishedAt',
        'language': 'en',
        'apiKey': Constants.of().apiKey,
      },
    ).then((response) => News.fromJson(response.data!));
  }
}