abstract class HomeEvent {}

class SelectPost extends HomeEvent {
  final String index;

  SelectPost(this.index);
}

class DeSelectPost extends HomeEvent {
  final String index;

  DeSelectPost(this.index);
}
