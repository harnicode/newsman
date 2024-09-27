import 'package:flutter/material.dart';
import 'package:newsman/app/n8n.dart';

import 'post/post_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Feed'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.navigate(PostRoute()),
          child: const Text('View All Posts'),
        ),
      ),
    );
  }
}
