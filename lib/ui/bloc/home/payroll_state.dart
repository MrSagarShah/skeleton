import 'package:equatable/equatable.dart';
import 'package:skeleton/data/model/news.dart';
import 'package:skeleton/data/model/result.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  final bool loading;

  LoadingState(this.loading);

  @override
  List<Object> get props => [loading];
}

class DataLoaded extends HomeState {
  DataLoaded(this.result);

  Result<News> result;

  @override
  List<Object> get props => [result];
}
