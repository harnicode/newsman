import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(selections: {})) {
    on<HandleTap>((event, emit) {
      final selections = state.selections;
      final onhandletap = HandleTap(event.index);

      if (selections.contains(onhandletap.index)) {
        onhandletap.deselect(onhandletap.index);
      } else {
        onhandletap.select(onhandletap.index);
      }
    });
  }
}
