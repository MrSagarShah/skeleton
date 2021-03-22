import 'package:bloc/bloc.dart';
import 'package:skeleton/data/model/news.dart';
import 'package:skeleton/data/model/result.dart';
import 'package:skeleton/data/repository/repository.dart';
import 'package:skeleton/ui/bloc/home/payroll_event.dart';
import 'package:skeleton/ui/bloc/home/payroll_state.dart';

import '../../../main.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState());

  @override
  HomeState get initialState => HomeInitState();
  final Repository repository = Repo.getInstance();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHomeData) {
      yield LoadingState(true);
      Result<News> result = await repository.getNews();
      print("STATE ${result}");
      yield LoadingState(false);
      yield DataLoaded(result);
    }
  }
}
