import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/features/posts/bloc/posts_bloc.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class AppBlocs extends StatelessWidget {
  final Widget child;

  const AppBlocs({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final repo = context.read<PostRepository>();
            return PostsBloc(postRepository: repo);
          },
        )
      ],
      child: child,
    );
  }
}
