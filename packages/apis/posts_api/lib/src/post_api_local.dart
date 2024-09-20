import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'exception_models/exception_models.dart';
import 'post_api_abstract.dart';
import 'response_models/response_models.dart';

class PostApiLocal extends PostApi {
  final _completer = Completer<List<PostApiPostModel>>();

  final String assetPath;

  PostApiLocal({this.assetPath = 'assets/posts.json'}) {
    rootBundle.loadString(assetPath).then((value) {
      final List<dynamic> data = jsonDecode(value);
      final List<PostApiPostModel> posts = data.map((item) {
        return PostApiPostModel.fromJson(item);
      }).toList();

      _completer.complete(posts);
    }).catchError((error) {
      _completer.completeError(error);
    });
  }

  @override
  Future<PostApiGetPostsResult> getAllPosts() async {
    try {
      final posts = await _completer.future;

      final result = PostApiGetPostsReponse(posts: posts);

      return success(result);
    } catch (e) {
      final exception = PostApiFatalException(
        code: 500,
        message: e.toString(),
        endpoint: '',
      );

      return failure(exception);
    }
  }
}
