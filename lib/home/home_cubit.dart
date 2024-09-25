import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  Set<String> selections;

  HomeState({
    required this.selections,
  });

  @override
  String toString() {
    return """HomeState($selections)""";
  }

  HomeState copyWith(Set<String>? selections) {
    return HomeState(
      selections: selections ?? this.selections,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(selections: {}));

  void handleTap(String id) {
    final selections = state.selections;

    if (selections.contains(id)) {
      _deselect(id);
    } else {
      _select(id);
    }
  }

  void _select(String id) {
    final selections = state.selections;

    selections.add(id);

    emit(state.copyWith(selections));
  }

  void _deselect(String id) {
    final selections = state.selections;

    selections.remove(id);

    emit(state.copyWith(selections));
  }
}
