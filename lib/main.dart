import 'package:flutter/material.dart';
import 'package:newsman/app.dart';
import 'package:newsman_posts_api/newsman_posts_api.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final PostApi api = PostApiLocal(assetPath: 'assets/json/posts.json');

  // final PostApi api = PostApiHttp(
  //   options: BaseOptions(baseUrl: 'https://jsonplaceholder.org'),
  // );

  final PostRepository repo = PostRepository(postApi: api);

  runApp(NewsmanApp(postRepository: repo));
}
