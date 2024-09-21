import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsman_posts_api/newsman_posts_api.dart';

import 'package:newsman_posts_repository/newsman_posts_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('get all posts', () async {
    final api = PostApiLocal();
    final repo = PostRepository(postApi: api);

    final posts = await repo.getAllPosts();

    expect(posts.length, 100);
  });
}
