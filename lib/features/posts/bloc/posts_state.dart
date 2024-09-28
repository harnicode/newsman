part of 'posts_bloc.dart';

class PostsState {
  Set<String> selections;
  List<PostModel> posts;

  PostsState({
    this.posts = const [],
    this.selections = const {},
  });

  @override
  String toString() {
    return """HomeState($selections)""";
  }

  PostsState copyWith({
    Set<String>? selections,
    List<PostModel>? posts,
  }) {
    return PostsState(
      selections: selections ?? this.selections,
      posts: posts ?? this.posts,
    );
  }
}
