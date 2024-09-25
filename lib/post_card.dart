import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/cubit/home_cubit.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class PostCard extends StatelessWidget {
  final List<PostModel> posts;
  final int postIndex;
  const PostCard({
    super.key,
    required this.posts,
    required this.postIndex,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit someCubit = context.read<HomeCubit>();
    bool selectedPost = someCubit.state.isSelected;
    Border? postBorder;
    debugPrint("Build PostCard with isSelected as $selectedPost");

    if (selectedPost == true) {
      postBorder = Border.all(color: Colors.red, width: 3);
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      height: 200,
      width: 20,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          border: postBorder,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(180, 179, 182, 1),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: 140,
            height: 200,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  posts[postIndex].image.toString(),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  posts[postIndex].title.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Published: ${posts[postIndex].metadata.publishedAt.toString().split(' ')[0]}',
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
