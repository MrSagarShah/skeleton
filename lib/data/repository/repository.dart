import '../model/news.dart';
import '../model/result.dart';

// ignore: one_member_abstracts
abstract class Repository {
  Future<Result<News>> getNews();
}