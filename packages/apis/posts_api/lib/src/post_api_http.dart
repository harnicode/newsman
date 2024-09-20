import 'package:dio/dio.dart';
import 'package:newsman_posts_api/newsman_posts_api.dart';

class PostApiHttp extends PostApi {
  final Dio _dio;

  PostApiHttp({required BaseOptions options}) : _dio = Dio(options);

  @override
  Future<PostApiGetPostsResult> getAllPosts() async {
    try {
      final response = await _dio.get('/posts');

      final List<dynamic> postsData = response.data;

      final List<PostApiPostModel> posts = postsData.map((item) {
        return PostApiPostModel.fromJson(item);
      }).toList();

      final result = PostApiGetPostsReponse(posts: posts);

      return success(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final exception = PostApiBadRequestException(
          code: 400,
          message: e.response?.statusMessage ?? e.toString(),
          endpoint: '/posts',
        );

        return failure(exception);
      }

      if (e.response?.statusCode == 404) {
        final exception = PostApiBadRequestException(
          code: 404,
          message: e.response?.statusMessage ?? e.toString(),
          endpoint: '/posts',
        );

        return failure(exception);
      }

      final exception = PostApiFatalException(
        code: e.response?.statusCode ?? 500,
        message: e.response?.statusMessage ?? 'There was a fatal Dio Exception',
        endpoint: '/posts',
      );

      return failure(exception);
    } catch (e) {
      final exception = PostApiFatalException(
        code: 500,
        message: e.toString(),
        endpoint: '/posts',
      );

      return failure(exception);
    }
  }
}
