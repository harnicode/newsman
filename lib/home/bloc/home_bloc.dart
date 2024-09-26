import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(selections: {})) {
    on<ToggleSelectionEvent>(_handleSelectionToggle);
  }

  void _handleSelectionToggle(ToggleSelectionEvent event, Emitter emit) {
    final selections = state.selections;

    if (selections.contains(event.postId)) {
      selections.remove(event.postId);
    } else {
      selections.add(event.postId);
    }

    emit(state.copyWith(selections));
  }
}
