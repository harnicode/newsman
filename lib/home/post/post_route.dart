import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/app/n8n.dart';
import 'package:newsman/home/home_route.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

import 'bloc/post_bloc.dart';
import 'post_detail.dart';
import 'post_list.dart';

class PostRoute extends N8nRoute {
  @override
  String get path => location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) {
        final repo = context.read<PostRepository>();
        return PostBloc(postRepository: repo);
      },
      child: const PostList(),
    );
  }
}

class PostDetailRoute extends N8nRoute {
  final String postId;

  PostDetailRoute({required this.postId});

  @override
  String get path => location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final post = context.select<PostBloc, PostModel>((bloc) {
      return bloc.state.posts.firstWhere((post) => post.id == postId);
    });

    return PostDetail(post: post);
  }
}
