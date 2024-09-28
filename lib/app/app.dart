import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/home/home_page.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class NewsmanApp extends StatelessWidget {
  final PostRepository postRepository;

  const NewsmanApp({
    super.key,
    required this.postRepository,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: postRepository,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
