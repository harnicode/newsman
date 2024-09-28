import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository _postRepository;

  PostsBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostsState()) {
    on<FetchPostsRequestedEvent>(_handleFetchPosts);
    on<ToggleSelectionEvent>(_handleSelectionToggle);

    add(FetchPostsRequestedEvent());
  }

  void _handleFetchPosts(FetchPostsRequestedEvent event, Emitter emit) async {
    final result = await _postRepository.getAllPosts();

    emit(state.copyWith(posts: result));
  }

  void _handleSelectionToggle(ToggleSelectionEvent event, Emitter emit) {
    final selections = Set<String>.from(state.selections);

    if (selections.contains(event.postId)) {
      selections.remove(event.postId);
    } else {
      selections.add(event.postId);
    }

    emit(state.copyWith(
      isSelectionActive: selections.isNotEmpty,
      selections: selections,
    ));
  }
}
