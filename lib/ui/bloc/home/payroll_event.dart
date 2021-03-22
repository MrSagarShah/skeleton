import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHomeData extends HomeEvent {

  LoadHomeData();

  @override
  List<Object> get props => [];
}
