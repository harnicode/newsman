import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/home/posts/bloc/posts_bloc.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

import 'posts_page.dart';

class PostsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) {
        final repo = context.read<PostRepository>();
        return PostsBloc(postRepository: repo);
      },
      child: const PostsPage(),
    );
  }
}
