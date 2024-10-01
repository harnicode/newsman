import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/app/navigation.dart';
import 'package:newsman/features/posts/bloc/posts_bloc.dart';
import 'package:newsman/features/posts/post_detail/post_detail_page.dart';
import 'package:newsman/features/posts/posts_route.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class PostDetailRoute extends N8nRoute {
  final String postId;

  PostDetailRoute({required this.postId});

  @override
  String get path => location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final post = context.select<PostsBloc, PostModel>((bloc) {
      final state = bloc.state;
      return state.posts.firstWhere((post) => post.id == postId);
    });

    return PostDetailPage(post: post);
  }
}
