import '../model/news.dart';
import '../model/result.dart';
import '../remote/news_data_source.dart';
import 'repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required DataSource dataSource})
      : _dataSource = dataSource;

  final DataSource _dataSource;

  @override
  Future<Result<News>> getNews() {
    return Result.guardFuture(_dataSource.getNews);
  }
}