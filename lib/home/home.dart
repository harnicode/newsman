import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:newsman/home/home_page.dart';
import 'package:newsman/home/bloc/home_bloc.dart';
import 'package:newsman/home/home_page.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

// import 'home_cubit.dart';

class Home extends StatelessWidget {
  final Future<List<PostModel>> Function() fetchPosts;
  const Home({super.key, required this.fetchPosts});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: HomePage(fetchPosts: fetchPosts),
    );
  }
}
