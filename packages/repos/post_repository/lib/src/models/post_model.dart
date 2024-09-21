import 'post_metadata.dart';

class PostModel {
  final String id;
  final String slug;
  final String url;
  final String title;
  final String content;
  final String image;
  final String thumbnail;
  final String userId;
  final PostMetadata metadata;

  PostModel({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.userId,
    required this.metadata,
  });

  @override
  String toString() {
    return """PostModel(
      id: '$id',
      slug: '$slug',
      url: '$url',
      title: '$title',
      content: '$content',
      image: '$image',
      thumbnail: '$thumbnail',
      userId: '$userId',
      metadata: '$metadata',
    )""";
  }
}
