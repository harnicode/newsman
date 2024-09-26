part of 'home_bloc.dart';

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
