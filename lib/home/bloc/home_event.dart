part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchPostsRequestedEvent extends HomeEvent {}

class ToggleSelectionEvent extends HomeEvent {
  final String postId;

  ToggleSelectionEvent({required this.postId});
}
