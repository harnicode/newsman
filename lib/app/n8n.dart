import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class N8nRoute extends GoRouteData {
  String get path;
}

extension N8n on BuildContext {
  void navigate<T extends N8nRoute>(T route) {
    go(route.path);
  }
}
