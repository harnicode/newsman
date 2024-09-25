import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/app/app.dart';
import 'package:newsman_posts_api/newsman_posts_api.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

import 'app/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const Observer();

  final PostApi api = PostApiLocal(assetPath: 'assets/json/posts.json');

  // final PostApi api = PostApiHttp(
  //   options: BaseOptions(baseUrl: 'https://jsonplaceholder.org'),
  // );

  final PostRepository repo = PostRepository(postApi: api);

  runApp(NewsmanApp(postRepository: repo));
}
