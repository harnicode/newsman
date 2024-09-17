import 'package:newsman_posts_api/src/exception_models/exception_models.dart';

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
        message: 'There was an api error',
        endpoint: '/posts',
      );

      return failure(exception);
    }
  }
}
