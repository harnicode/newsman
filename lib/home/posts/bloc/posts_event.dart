part of 'posts_bloc.dart';

abstract class PostsEvent {}

class FetchPostsRequestedEvent extends PostsEvent {}

class ToggleSelectionEvent extends PostsEvent {
  final String postId;

  ToggleSelectionEvent({required this.postId});
}
