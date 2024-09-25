import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  bool isSelected;
  List<String> selectedPosts;

  HomeState({
    required this.isSelected,
    required this.selectedPosts,
  });
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(isSelected: false, selectedPosts: []));

  void selectPost(index) {
    state.selectedPosts.add(index);
    state.isSelected = true;
    emit(state);
  }

  void unSelectPost(index) {
    state.selectedPosts.remove(index);
    state.isSelected = false;
    emit(state);
  }
}
