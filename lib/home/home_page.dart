import 'package:flutter/material.dart';
import 'package:newsman/home/home_route.dart';
import 'package:newsman/home/posts/posts_route.dart';

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
          onPressed: () {
            PostsRoute().go(context);
          },
          child: const Text('View Posts'),
        ),
      ),
    );
  }
}
