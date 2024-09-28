import 'package:flutter/material.dart';
import 'package:newsman/app/navigation.dart';

import '../posts/posts_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newsman'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.navigate(PostsRoute()),
          child: const Text('View Posts'),
        ),
      ),
    );
  }
}
