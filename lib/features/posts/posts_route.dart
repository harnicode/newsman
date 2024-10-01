import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/app/navigation.dart';

import 'post_detail/post_detail_route.dart';
import 'posts_page.dart';

part 'posts_route.g.dart';

@TypedGoRoute<PostsRoute>(
  path: '/posts',
  routes: [
    TypedGoRoute<PostDetailRoute>(path: ':postId'),
  ],
)
class PostsRoute extends N8nRoute {
  @override
  String get path => location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PostsPage();
  }
}
