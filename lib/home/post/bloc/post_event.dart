part of 'post_bloc.dart';

abstract class PostEvent {}

class FetchPostsRequestedEvent extends PostEvent {}

class ToggleSelectionEvent extends PostEvent {
  final String postId;

  ToggleSelectionEvent({required this.postId});
}
