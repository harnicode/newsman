import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Define the Homestate
class HomeState {
  final Set<String> selections;
  HomeState({required this.selections});

  @override
  String toString() {
    return "HomeState($selections)";
  }

  HomeState copyWith(Set<String>? selections) {
    return HomeState(
      selections: selections ?? this.selections,
    );
  }
}

//Define event for Home
abstract class HomeEvent {}

class ToggleSelectionEvent extends HomeEvent {
  final String id;
  ToggleSelectionEvent(this.id);
}

//Define the Bloc to manage the home state
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(selections: {})) {
    on<ToggleSelectionEvent>(onToggleSelection);
  }
//Now handle the toggleSelectionEvent to update the state
  void onToggleSelection(ToggleSelectionEvent event, Emitter<HomeState> emit) {
    final newSelections = Set<String>.from(state.selections);

    //define condition to track event
    if (newSelections.contains(event.id)) {
      newSelections.remove(event.id);
    } else {
      newSelections.add(event.id);
    }
    emit(state.copyWith(newSelections));
  }
}
