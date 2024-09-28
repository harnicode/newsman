part of 'posts_bloc.dart';

class PostsState {
  Set<String> selections;
  List<PostModel> posts;
  bool isSelectionActive;

  PostsState({
    this.posts = const [],
    this.selections = const {},
    this.isSelectionActive = false,
  });

  @override
  String toString() {
    return """HomeState($selections)""";
  }

  PostsState copyWith({
    Set<String>? selections,
    List<PostModel>? posts,
    bool? isSelectionActive,
  }) {
    return PostsState(
      selections: selections ?? this.selections,
      posts: posts ?? this.posts,
      isSelectionActive: isSelectionActive ?? this.isSelectionActive,
    );
  }
}
