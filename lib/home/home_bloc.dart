import 'package:bloc/bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(isSelected: false, selectedPosts: {})) {
    on<SelectPost>((event, emit) {
      state.selectedPosts.add(event.index);
      state.isSelected = true;
      emit(state);
    });

    on<DeSelectPost>((event, emit) {
      state.selectedPosts.remove(event.index);
      state.isSelected = false;
      emit(state);
    });
  }
}
