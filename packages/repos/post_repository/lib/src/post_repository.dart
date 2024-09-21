import 'package:flutter/foundation.dart';
import 'package:newsman_posts_api/newsman_posts_api.dart';

import 'models/models.dart';

class PostRepository {
  final PostApi _postApi;

  PostRepository({required PostApi postApi}) : _postApi = postApi;

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];

    final (:exception, :response) = await _postApi.getAllPosts();

    if (exception != null) {
      debugPrint(exception.message);
    }

    if (response != null) {
      final apiPosts = response.posts;

      posts = apiPosts.map((item) {
        return PostModel(
          id: item.id.toString(),
          slug: item.slug,
          url: item.url,
          title: item.title,
          content: item.content,
          image: item.image,
          thumbnail: item.thumbnail,
          userId: item.userId.toString(),
          metadata: PostMetadata(
            status: item.category,
            category: item.category,
            publishedAt: item.publishedAt,
            updatedAt: item.updatedAt,
          ),
        );
      }).toList();
    }

    return posts;
  }
}
