import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/cubit/home_cubit.dart';
import 'package:newsman/post_card.dart';

import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class HomeView extends StatelessWidget {
  final List<PostModel> posts;
  const HomeView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BlogPost Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        color: const Color.fromRGBO(212, 211, 215, 1),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final cubit = context.watch<HomeCubit>();
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (!cubit.state.selectedPosts.contains(posts[index].id)) {
                      cubit.selectPost(posts[index].id);
                      debugPrint(cubit.state.selectedPosts.toString());
                      debugPrint(cubit.state.isSelected.toString());
                    } else {
                      cubit.unSelectPost(posts[index].id);
                      debugPrint(cubit.state.selectedPosts.toString());
                      debugPrint(cubit.state.isSelected.toString());
                    }
                  },
                  child: PostCard(posts: posts, postIndex: index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
