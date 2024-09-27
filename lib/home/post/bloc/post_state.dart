part of 'post_bloc.dart';

class PostState {
  List<PostModel> posts;
  Set<String> selections;
  bool isSelectionActive;

  PostState({
    this.posts = const [],
    this.selections = const {},
    this.isSelectionActive = false,
  });

  @override
  String toString() {
    return """HomeState($selections)""";
  }

  PostState copyWith({
    List<PostModel>? posts,
    Set<String>? selections,
    bool? isSelectionActive,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      selections: selections ?? this.selections,
      isSelectionActive: isSelectionActive ?? this.isSelectionActive,
    );
  }
}
