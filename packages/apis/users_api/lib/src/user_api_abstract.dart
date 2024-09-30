import 'response_models/response_models.dart';
import 'typedef.dart';

abstract class PostApi {
  PostApi();

  PostApiResult<E, T> success<E, T>(T value) {
    return (exception: null, response: value);
  }

  PostApiResult<E, T> failure<E, T>(E error) {
    return (exception: error, response: null);
  }

  Future<PostApiGetPostsResult> getAllPosts();
}
