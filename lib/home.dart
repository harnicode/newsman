import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class Home extends StatelessWidget {
  final Future<List<PostModel>> Function() fetchPosts;

  const Home({
    super.key,
    required this.fetchPosts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Feed'),
      ),
      body: FutureBuilder(
        future: fetchPosts(),
        initialData: const <PostModel>[],
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PostModel>> snapshot,
        ) {
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(
              child: Text('There was an error fetching posts'),
            );
          }

          final posts = snapshot.data!;

          if (posts.isEmpty) {
            return const Center(
              child: Text('Waiting for the first post!'),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              final publishedAt = post.metadata.publishedAt;
              final dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
              final fineFormat = DateFormat('EEEE MMMM d, yyyy');

              final publishedDate = dateFormat.parse(publishedAt);
              final published = fineFormat.format(publishedDate);

              return Card(
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
              );
            },
          );
        },
      ),
    );
  }
}
