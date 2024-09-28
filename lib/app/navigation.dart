import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class N8nRoute extends GoRouteData {
  String get path;
}

extension N8n on BuildContext {
  navigate<R extends N8nRoute>(R route, {bool pop = false}) {
    if (pop) {
      replace(route.path);
      return;
    }

    go(route.path);
  }
}
