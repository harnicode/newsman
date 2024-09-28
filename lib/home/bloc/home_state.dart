part of 'home_bloc.dart';

class HomeState {
  Set<String> selections;
  List<PostModel> posts;

  HomeState({
    this.posts = const [],
    this.selections = const {},
  });

  @override
  String toString() {
    return """HomeState($selections)""";
  }

  HomeState copyWith({
    Set<String>? selections,
    List<PostModel>? posts,
  }) {
    return HomeState(
      selections: selections ?? this.selections,
      posts: posts ?? this.posts,
    );
  }
}
