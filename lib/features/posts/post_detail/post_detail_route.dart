import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/app/navigation.dart';
import 'package:newsman/features/posts/post_detail/post_detail_page.dart';
import 'package:newsman/features/posts/posts_route.dart';

class PostDetailRoute extends N8nRoute {
  final String postId;

  PostDetailRoute({required this.postId});

  @override
  String get path => location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    debugPrint('PostDetailRoute: $postId');

    return const PostDetailPage();
  }
}
