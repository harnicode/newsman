class PostApiPostModel {
  final int id;
  final String slug;
  final String url;
  final String title;
  final String content;
  final String image;
  final String thumbnail;
  final String status;
  final String category;
  final String publishedAt;
  final String updatedAt;
  final int userId;

  PostApiPostModel({
    required this.category,
    required this.content,
    required this.id,
    required this.image,
    required this.publishedAt,
    required this.slug,
    required this.status,
    required this.thumbnail,
    required this.title,
    required this.updatedAt,
    required this.url,
    required this.userId,
  });

  factory PostApiPostModel.fromJson(Map<String, dynamic> json) {
    return PostApiPostModel(
      category: json['category'],
      content: json['content'],
      id: json['id'],
      image: json['image'],
      publishedAt: json['publishedAt'],
      slug: json['slug'],
      status: json['status'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      updatedAt: json['updatedAt'],
      url: json['url'],
      userId: json['userId'],
    );
  }
}
