import '../exception_models/exceptions.dart';
import '../typedef.dart';
import 'post_model.dart';

typedef PostApiGetPostsResult
    = PostApiResult<PostApiException, PostApiGetPostsReponse>;

class PostApiGetPostsReponse {
  final List<PostApiPostModel> posts;

  PostApiGetPostsReponse({
    required this.posts,
  });
}
