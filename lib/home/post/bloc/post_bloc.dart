import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostState()) {
    on<FetchPostsRequestedEvent>(_handleFetchPosts);
    on<ToggleSelectionEvent>(_handleSelectionToggle);

    add(FetchPostsRequestedEvent());
  }

  void _handleFetchPosts(FetchPostsRequestedEvent event, Emitter emit) async {
    final posts = await _postRepository.getAllPosts();
    emit(state.copyWith(posts: posts));
  }

  void _handleSelectionToggle(ToggleSelectionEvent event, Emitter emit) {
    final selections = Set<String>.from(state.selections);

    if (selections.contains(event.postId)) {
      selections.remove(event.postId);
    } else {
      selections.add(event.postId);
    }

    if (selections.isEmpty) {
      emit(state.copyWith(
        selections: selections,
        isSelectionActive: false,
      ));
      return;
    }

    emit(state.copyWith(
      selections: selections,
      isSelectionActive: true,
    ));
  }
}
