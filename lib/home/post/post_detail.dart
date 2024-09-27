import 'package:flutter/material.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class PostDetail extends StatelessWidget {
  final PostModel post;

  const PostDetail({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Column(
        children: [Image.network(post.image)],
      ),
    );
  }
}
