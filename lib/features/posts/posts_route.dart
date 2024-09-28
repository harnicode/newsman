import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/app/navigation.dart';
import 'package:newsman/features/posts/bloc/posts_bloc.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

import 'posts_page.dart';

part 'posts_route.g.dart';

@TypedGoRoute<PostsRoute>(path: '/posts')
class PostsRoute extends N8nRoute {
  @override
  String get path => location;

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
