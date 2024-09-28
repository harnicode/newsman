import 'package:flutter/material.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class PostDetailPage extends StatelessWidget {
  final PostModel? post;

  const PostDetailPage({super.key, this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(post?.title ?? ''),
      ),
    );
  }
}
