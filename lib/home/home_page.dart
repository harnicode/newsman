import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/home/home.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

import 'bloc/home_bloc.dart';
// import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repo = context.read<PostRepository>();
        return HomeBloc(postRepository: repo);
      },
      child: const Home(),
    );
  }
}
