import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/app/n8n.dart';

import 'home_page.dart';
import 'post/post_route.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<PostRoute>(
      path: 'posts',
      routes: [TypedGoRoute<PostDetailRoute>(path: ':postId')],
    ),
  ],
)
class HomeRoute extends N8nRoute {
  @override
  String get path => location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
