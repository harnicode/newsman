import 'dart:convert';

import 'package:flutter/services.dart';

import 'exception_models/exception_models.dart';
import 'post_api_abstract.dart';
import 'response_models/response_models.dart';

class PostApiLocal extends PostApi {
  @override
  Future<PostApiGetPostsResult> getAllPosts() async {
    try {
      final response = PostApiGetPostsReponse(posts: []);
      return success(response);
    } catch (e) {
      final exception = PostApiBadRequestException(
        code: 400,
        message: e.toString(),
        endpoint: '/posts',
      );

      return failure(exception);
    }
  }

  Future<List<PostApiPostModel>> fetchAllPosts() async {
    List<PostApiPostModel> posts;

    final value = await rootBundle.loadString('assets/json/posts.json');

    final List<dynamic> data = jsonDecode(value);
    posts = data.map((item) => PostApiPostModel.fromJson(item)).toList();

    return posts;
  }
}
