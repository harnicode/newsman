import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:newsman_posts_api/newsman_posts_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('getAllPosts() throws appropriate exception', () async {
    final api = PostApiLocal();

    final (:exception, :response) = await api.getAllPosts();

    const isException = TypeMatcher<PostApiFatalException>();

    expect(exception, isException);
    expect(exception!.code, 500);
    expect(response, null);
  });
}
