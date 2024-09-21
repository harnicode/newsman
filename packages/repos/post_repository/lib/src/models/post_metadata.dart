class PostMetadata {
  final String status;
  final String category;
  final String publishedAt;
  final String updatedAt;

  PostMetadata({
    required this.status,
    required this.category,
    required this.publishedAt,
    required this.updatedAt,
  });

  @override
  toString() {
    return """PostMetadata(
      status: $status, 
      category: $category, 
      publishedAt: $publishedAt, 
      updatedAt: $updatedAt,
    )""";
  }
}
