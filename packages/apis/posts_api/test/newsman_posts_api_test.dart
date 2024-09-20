import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:newsman_posts_api/newsman_posts_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('PostApiLocal.getAllPosts() returns the list of posts', () async {
    final api = PostApiLocal();

    final (:exception, :response) = await api.getAllPosts();

    const isResult = TypeMatcher<PostApiGetPostsReponse>();

    expect(exception, null);
    expect(response, isResult);
    expect(response!.posts.length, 100);
  });
}
