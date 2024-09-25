import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/cubit/home_cubit.dart';
import 'package:newsman/home_view.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class Home extends StatefulWidget {
  final PostRepository blogPostRepo;

  const Home({super.key, required this.blogPostRepo});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostModel> blogPosts = [];

  @override
  void initState() {
    retrievePosts();
    super.initState();
  }

  void retrievePosts() {
    widget.blogPostRepo.getAllPosts().then((value) {
      setState(() {
        blogPosts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      posts: blogPosts,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<PostModel>posts;
  const HomePage({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(posts: posts)
    );
  }
}
