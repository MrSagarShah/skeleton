import '../model/news.dart';

// ignore: one_member_abstracts
abstract class DataSource {
  Future<News> getNews();
}