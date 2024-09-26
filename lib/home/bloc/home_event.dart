abstract class HomeEvent {}

class HandleTap extends HomeEvent {
  final String index;

  HandleTap(this.index);

  void select(index){}
  void deselect(index){}
}