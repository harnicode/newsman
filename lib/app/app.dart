import 'package:flutter/material.dart';
import 'package:newsman/home/home.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class NewsmanApp extends StatelessWidget {
  final PostRepository postRepository;

  const NewsmanApp({
    super.key,
    required this.postRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        fetchPosts: postRepository.getAllPosts,
      ),
    );
  }
}
