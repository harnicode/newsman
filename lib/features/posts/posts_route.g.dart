// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $postsRoute,
    ];

RouteBase get $postsRoute => GoRouteData.$route(
      path: '/posts',
      factory: $PostsRouteExtension._fromState,
    );

extension $PostsRouteExtension on PostsRoute {
  static PostsRoute _fromState(GoRouterState state) => PostsRoute();

  String get location => GoRouteData.$location(
        '/posts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
