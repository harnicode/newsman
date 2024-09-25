import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/home/home.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  final Future<List<PostModel>> Function() fetchPosts;
  const HomePage({super.key, required this.fetchPosts});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Home(fetchPosts: fetchPosts),
    );
  }
}
