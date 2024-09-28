import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newsman/app/navigation.dart';
import 'package:newsman/features/home/home_route.dart';

import 'bloc/posts_bloc.dart';
import 'post_detail/post_detail_route.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.navigate(HomeRoute()),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Posts Feed'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.posts.isEmpty) {
            return const Center(
              child: Text('Waiting for the first post'),
            );
          }

          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              final publishedAt = post.metadata.publishedAt;
              final dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
              final fineFormat = DateFormat('EEEE MMMM d, yyyy');

              final publishedDate = dateFormat.parse(publishedAt);
              final published = fineFormat.format(publishedDate);

              return GestureDetector(
                onTap: () {
                  final bloc = context.read<PostsBloc>();

                  if (state.isSelectionActive) {
                    bloc.add(ToggleSelectionEvent(postId: post.id));
                    return;
                  }

                  context.navigate(PostDetailRoute(postId: post.id));
                },
                onLongPress: () {
                  if (!state.isSelectionActive) {
                    final bloc = context.read<PostsBloc>();
                    bloc.add(ToggleSelectionEvent(postId: post.id));
                  }
                },
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3,
                      color: state.selections.contains(post.id)
                          ? Colors.purple
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.network(post.image),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    post.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(published.toString()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
