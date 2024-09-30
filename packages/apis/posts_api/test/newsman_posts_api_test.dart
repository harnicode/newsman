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

  test('PostApiHttp.getAllPosts() returns the list of posts', () async {
    final api = PostApiHttp(
      options: BaseOptions(
        baseUrl: 'https://jsonplaceholder.org',
      ),
    );

    final (:exception, :response) = await api.getAllPosts();

    const isResult = TypeMatcher<PostApiGetPostsReponse>();

    expect(exception, null);
    expect(response, isResult);
    expect(response!.posts.length, 100);
  });

  test('PostApiHttp.getAllPosts() returns a bad request exception', () async {
    final api = PostApiHttp(
      options: BaseOptions(
        baseUrl: 'https://jsonplaceholder.org/a',
      ),
    );

    final (:exception, :response) = await api.getAllPosts();

    const isException = TypeMatcher<PostApiBadRequestException>();

    expect(exception, isException);
    expect(response, null);
  });
}
