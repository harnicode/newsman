part of 'home_bloc.dart';

class HomeState {
  List<PostModel> posts;
  Set<String> selections;

  HomeState({
    this.posts = const [],
    required this.selections,
  });

  @override
  String toString() {
    return """HomeState($selections)""";
  }

  HomeState copyWith({
    List<PostModel>? posts,
    Set<String>? selections,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      selections: selections ?? this.selections,
    );
  }
}
