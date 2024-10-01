import 'package:go_router/go_router.dart';
import 'package:newsman/features/home/home_route.dart';
import 'package:newsman/features/posts/posts_route.dart';

final router = GoRouter(
  initialLocation: HomeRoute().location,
  routes: [
    $homeRoute,
    $postsRoute,
  ],
);
